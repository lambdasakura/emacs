;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setup load-path and autoloads
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load (expand-file-name "~/.roswell/impls/ALL/ALL/quicklisp/slime-helper.el"))

(when run-w32
  (setq slime-lisp-implementations
        `((sbcl ("sbcl") :coding-system utf-8-unix)
          (ccl ("C:/ccl/wx86cl.exe") :coding-system utf-8-unix)))
  (setf slime-default-lisp 'sbcl))

(when (or run-darwin run-linux)
  (setf slime-lisp-implementations
        `((sbcl    ("sbcl" "--dynamic-space-size" "2000"))
          (roswell ("ros" "dynamic-space-size=2000" "-Q" "-l" "~/.sbclrc" "run"))))
  (setf slime-default-lisp 'roswell))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slime自体の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq slime-net-coding-system 'utf-8-unix)
(setq slime-truncate-lines 't)
(slime-setup '(slime-repl))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 自動補完
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;; --------------------------------
;; HyperSpec を emacs-w3m で参照する
;; --------------------------------
(require 'hyperspec)

;; HyperSpecのパスを指定
(setq common-lisp-hyperspec-root "file:///home/sakura/.emacs.d/cl-docs/HyperSpec/"
      common-lisp-hyperspec-symbol-table (expand-file-name "~/.emacs.d/cl-docs/HyperSpec/Data/Map_Sym.txt"))

(defadvice common-lisp-hyperspec
    (around hyperspec-lookup-w3m () activate)
  (let* ((window-configuration (current-window-configuration))
         (browse-url-browser-function
          `(lambda (url new-window)
             (w3m-browse-url url nil)
             (let ((hs-map (copy-keymap w3m-mode-map)))
               (define-key hs-map (kbd "q")
                 (lambda ()
                   (interactive)
                   (kill-buffer nil)
                   (set-window-configuration ,window-configuration)))
               (use-local-map hs-map)))))
    ad-do-it))


;; --------------------------------
;; CLTL2 を emacs-w3m で参照する
;; --------------------------------
(require 'cltl2)

;; cltl2 の html を配置したパスを指定(w3mから参照できる形式)
(setq cltl2-root-url "file:///home/sakura/.emacs.d/cl-docs/cltl/")

(defadvice cltl2-lookup (around cltl2-lookup-by-w3m () activate)
  (let* ((window-configuration (current-window-configuration))
         (browse-url-browser-function
          `(lambda (url new-window)
             (w3m-browse-url url nil)
             (let ((cltl2-map (copy-keymap w3m-mode-map)))
               (define-key cltl2-map (kbd "q")
                 (lambda ()
                   (interactive)
                   (kill-buffer nil)
                   (set-window-configuration ,window-configuration)))
               (use-local-map cltl2-map)))))
    ad-do-it))


;; --------------------------------
;; Hyperspec と cltl2 を helm から引く
;; --------------------------------

(eval-after-load "helm"
  '(progn
     (setq helm-c-source-hyperspec
           `((name . "Lookup Hyperspec")
             (candidates . (lambda ()
                             (let ((symbols nil))
                               (mapatoms #'(lambda (sym) (push (symbol-name sym) symbols))
                                         imple-common-lisp-hyperspec-symbols)
                               symbols)))
             (action . (("Show Hyperspec" . hyperspec-lookup)))))

     (setq helm-c-source-cltl2
           `((name . "Lookup CLTL2")
             (candidates . (lambda ()
                             (let ((symbols nil))
                               (mapatoms #'(lambda (sym) (push (symbol-name sym) symbols))
                                         cltl2-symbols)
                               symbols)))
             (action . (("Show CLTL2" . cltl2-lookup)))))

     (defun helm-hyperspec-and-cltl2 ()
       (interactive)
       (helm '(helm-c-source-hyperspec helm-c-source-cltl2) (thing-at-point 'symbol)))))

(global-set-key "\C-cH" 'helm-hyperspec-and-cltl2)


;; 2014/05/11
;; 以下、slime2.4 からバージョンアップしたら
;; HyperSpecが引けなくなったので、旧 hyperspec.el から移植

(defvar imple-common-lisp-hyperspec-symbols (make-vector 67 0))

(defun imple-intern-clhs-symbol (string relative-url)
  (let ((symbol (intern string imple-common-lisp-hyperspec-symbols)))
    (if (boundp symbol)
        (push relative-url (symbol-value symbol))
      (set symbol (list relative-url)))))

(defun imple-hyperspec--get-one-line ()
  (prog1
      (delete* ?\n (thing-at-point 'line))
    (forward-line)))

(defun imple-hyperspec-make-symbles ()
  (if common-lisp-hyperspec-symbol-table
      (with-current-buffer (find-file-noselect
                            common-lisp-hyperspec-symbol-table)
        (goto-char (point-min))
        (while (< (point) (point-max))
          (let* ((symbol-name (downcase (imple-hyperspec--get-one-line)))
                 (relative-url (imple-hyperspec--get-one-line)))
            (imple-intern-clhs-symbol symbol-name
                                      (subseq relative-url
                                              (1+ (position ?\/ relative-url
                                                            :from-end t))))))
        (kill-buffer (current-buffer)))))

(imple-hyperspec-make-symbles)

;; Evilだとmacro確認の度にInsertに入るのが面倒なので
;; evil-modeを切ってしまう
(add-hook 'slime-mode-hook
          (lambda ()
            (if (member 'slime-macroexpansion-minor-mode  minor-mode-list)
                (turn-off-evil-mode))))
