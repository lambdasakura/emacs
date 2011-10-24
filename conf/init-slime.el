;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 各種環境用にslimeの読込
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; quick-lispの環境設定
(setf *slime-helper-path* (expand-file-name "~/quicklisp/slime-helper.el"))
(setf *clozure-slime-helper-path* (expand-file-name "C:/Documents and Settings/f9078010/quicklisp/slime-helper.el"))

;; 自前で持ってるslimeの在り処を追加
(add-to-list 'load-path "~/.emacs.d/elisp/slime-2010-08-19")
(when run-w32
  ;; SBCL
  (if (file-exists-p  *slime-helper-path*)
      (load *slime-helper-path*))
  ;; Clozure CL
  (if (file-exists-p *clozure-slime-helper-path*)
      (load *clozure-slime-helper-path*)))
(when run-darwin
  ;; mac ports
  (add-to-list 'load-path "/opt/local/share/emacs/site-lisp/slime"))
(when run-linux
  (if (file-exists-p  *slime-helper-path*)
      (load *slime-helper-path*)))

(require 'slime-autoloads)
(require 'slime)
(add-to-list 'load-path
"/Users/sakura/quicklisp/dists/quicklisp/software/cl-annot-20110418-git/misc")
(require 'slime-annot)
(require 'ac-slime)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Lisp実装の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when run-w32
  (setq slime-lisp-implementations
	`((ccl ("D:/ccl-1.7/wx86cl.exe") :coding-system utf-8-unix)
	  (sbcl ("sbcl") :coding-system utf-8-unix)
	  (clisp ("clisp") :coding-system utf-8-unix)
	  (ccl ("C:/ProgramingLanguages/ccl/wx86cl.exe") :coding-system utf-8-unix)
	  (cmucl ("lisp")))))
(when run-darwin
  (setq slime-lisp-implementations
	`((sbcl ("/opt/local/bin/sbcl"))
	  (abcl ("/opt/local/bin/abcl"))
	  (clisp ("/opt/local/bin/clisp")))))
(when run-linux
  (setq slime-lisp-implementations
	`((sbcl ("sbcl") :coding-system utf-8-unix)
	  (clisp ("clisp") :coding-system utf-8-unix))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slime自体の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 標準の処理系はSBCL
(setq inferior-lisp-program "sbcl")
;; utf-8で通信
(setq slime-net-coding-system 'utf-8-unix)
;; slimeの起動オプションの設定
(slime-setup '(slime-fancy slime-banner slime-autodoc))

;; 雑多な設定
;;(eval-after-load "slime"
;;  '(slime-setup '(slime-fancy slime-banner)))
;; (setq slime-truncate-lines nil)
;; (setq slime-enable-evaluate-in-emacs t)
;; (slime-autodoc-mode)
;; slime使っていると入力モード切り替えが上手くいかない
;; 環境があるので、そのための対処
(defun ime-onoff-slime ()
  (interactive)
  (if slime-mode
      (progn
	(slime-mode nil)
	(toggle-input-method))
    (if (string= major-mode "lisp-mode")
	(progn
	  (slime-mode t)
	  (toggle-input-method))
      (toggle-input-method))))

;; emacs lisp用のlisp-modeはemacs-lisp-modeを使用する設定に
(setq auto-mode-alist
      (append
       '(("/.el" . emacs-lisp-mode))
       '(("/.emacs-*" . emacs-lisp-mode))
       '(("/.wl" . emacs-lisp-mode))
       auto-mode-alist))

(add-hook 'lisp-mode-hook
	  (lambda ()
	    (cond ((featurep 'slime)
		   (slime-mode t) 
		   (show-paren-mode 1)
		   auto-complete-mode
		   (local-set-key "\t" 'slime-indent-and-complete-symbol)
		   (global-set-key "\C-cH" 'hyperspec-lookup)
		   (global-set-key "\C-\\" 'ime-onoff-slime))
		  (t
		   (normal-mode)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slime-modeのhook
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
         (if (not (minibufferp (current-buffer)))
      (auto-complete-mode 1))))
(real-global-auto-complete-mode t)

;; (add-hook 'slime-mode-hook
;; 	  (lambda ()
;; 	    (setq lisp-indent-function 'common-lisp-indent-function)
;; 	    auto-complete-mode))

;; (add-hook 'slime-connected-hook
;; 	  (lambda ()
;; 	    (slime-cd "~")
;; 	    auto-complete-mode))

;; (add-hook 'inferior-lisp-mode-hook
;;           (lambda ()
;;             (slime-mode t)
;; 	    (inferior-slime-mode t)
;;             (show-paren-mode)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; インデントの設定
;; Additional definitions by Pierpaolo Bernardi.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun cl-indent (sym indent)
  (put sym 'common-lisp-indent-function
       (if (symbolp indent)
           (get indent 'common-lisp-indent-function)
         indent)))
(cl-indent 'if '1)
(cl-indent 'generic-flet 'flet)
(cl-indent 'generic-labels 'labels)
(cl-indent 'with-accessors 'multiple-value-bind)
(cl-indent 'with-added-methods '((1 4 ((&whole 1))) (2 &body)))
(cl-indent 'with-condition-restarts '((1 4 ((&whole 1))) (2 &body)))
(cl-indent 'with-simple-restart '((1 4 ((&whole 1))) (2 &body)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HyperSpecをw3mで見る
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (featurep 'w3m)
  (require 'hyperspec)
  (setq common-lisp-hyperspec-root
	(concat "file://"
		(expand-file-name "~/.emacs.d/HyperSpec/"))
	common-lisp-hyperspec-symbol-table
	(expand-file-name "~/.emacs.d/HyperSpec/Data/MapSym.txt"))
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
      ad-do-it)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 起動用の関数群
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun cmucl-start ()
  (interactive)
  (shell-command ""))
(defun sbcl-start ()
  (interactive)
  (shell-command "sbcl --load $HOME/.slime.l &"))
(defun clisp-start ()
  (interactive)
  (shell-command (format "clisp -K full -q -ansi -i %s/.slime.l &" (getenv "HOME"))))

(defun slime-on (x)
  (progn (setq inferior-lisp-program x)
	 (slime)))
(defun slime-clisp ()
  (interactive)
  (slime-on "clisp"))
(defun slime-sbcl ()
  (interactive)
  (slime-on "sbcl"))

