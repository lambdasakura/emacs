;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setup load-path and autoloads
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'slime-autoloads)

(defun slime-repl-bol-insert ()
  (interactive)
  (slime-repl-bol))

(when run-w32
  (setq slime-lisp-implementations
        `((sbcl ("sbcl") :coding-system utf-8-unix)
          (ccl ("C:/ccl/wx86cl.exe") :coding-system utf-8-unix))))
(when run-darwin
  (setenv "SBCL_HOME" "/Users/sakura/Application/sbcl/lib/sbcl")
  (setq slime-lisp-implementations
        `((ccl ("/Users/sakura/bin/ccl") :coding-system utf-8-unix)
          (sbcl ("/Users/sakura/Application/sbcl/bin/sbcl") :coding-system utf-8-unix))))

(when run-linux
  (setq slime-lisp-implementations
        `((sbcl ("sbcl") :coding-system utf-8-unix)
          (ccl ("~/bin/ccl") :coding-system utf-8-unix)
          (clisp ("clisp") :coding-system utf-8-unix))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; slime自体の設定
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq slime-net-coding-system 'utf-8-unix)
(setq slime-truncate-lines 't)
(setq inferior-lisp-program 'sbcl)

;; (setq slime-contribs '(slime-banner slime-fancy slime-autodoc))
;; (slime-setup slime-contribs)
(slime-setup '(slime-repl))

;; (eval-after-load "slime"
;;   (lambda () (define-key evil-normal-state-map "I" 'slime-repl-bol-insert)))



;; slime使っていると入力モード切り替えが上手くいかない
;; 環境があるので、そのための対処
(defun ime-onoff-slime ()
  (interactive)
  (when slime-mode
    (slime-mode nil)
    (toggle-input-method)
    (when (string= major-mode "lisp-mode")
      (slime-mode t)
      (toggle-input-method)
      (toggle-input-method))))
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;; --------------------------------
;; HyperSpec を emacs-w3m で参照する
;; --------------------------------
(require 'hyperspec)

;; HyperSpecのパスを指定
(setq
 common-lisp-hyperspec-root
 "file:///home/sakura/.emacs.d/cl-docs/HyperSpec/"

 common-lisp-hyperspec-symbol-table
 (expand-file-name "~/.emacs.d/cl-docs/HyperSpec/Data/Map_Sym.txt"))

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
