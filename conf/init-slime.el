(require 'slime)
(require 'slime-autoloads)
;; (require 'slime-annot)
(defun slime-repl-bol-insert ()
  (interactive)
  (slime-repl-bol)
  (evil-insert 1))

   
(when run-w32
  (setq slime-lisp-implementations
	`((sbcl ("sbcl") :coding-system utf-8-unix)
	  (ccl ("C:/Programs/ccl/wx86cl.exe") :coding-system utf-8-unix))))
(when run-darwin
  (setq slime-lisp-implementations
	`((sbcl ("/usr/local/bin/sbcl") :coding-system utf-8-unix))))
(when run-linux
  (setq slime-lisp-implementations
	`((sbcl ("sbcl") :coding-system utf-8-unix)
	  (ccl ("~/bin/ccl") :coding-system utf-8-unix)
	  (clisp ("clisp") :coding-system utf-8-unix))))

(setq slime-net-coding-system 'utf-8-unix) 
(setq slime-truncate-lines 't)
(setq inferior-lisp-program 'sbcl)

;; (setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-banner slime-fancy))
(slime-setup slime-contribs)

(eval-after-load "slime"
  (lambda () (define-key evil-normal-state-map "I" 'slime-repl-bol-insert)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slime自体の設定
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;     ;; slimeの起動オプションの設定
;; (slime-setup '(slime-fancy slime-banner slime-autodoc))

;;     ;; 雑多な設定
;;     ;;(eval-after-load "slime"
;;     ;;  '(slime-setup '(slime-fancy slime-banner)))
;;     ;; (setq slime-truncate-lines nil)
;;     ;; (setq slime-enable-evaluate-in-emacs t)
;;     ;; (slime-autodoc-mode)

;;     ;; slime使っていると入力モード切り替えが上手くいかない
;;     ;; 環境があるので、そのための対処
;;     (defun ime-onoff-slime ()
;;       (interactive)
;;       (if slime-mode
;; 	  (progn
;; 	    (slime-mode nil)
;; 	    (toggle-input-method))
;; 	(if (string= major-mode "lisp-mode")
;; 	    (progn
;; 	      (slime-mode t)
;; 	      (toggle-input-method))
;; 	  (toggle-input-method))))

;;     ;; emacs lisp用のlisp-modeはemacs-lisp-modeを使用する設定に
;;     (setq auto-mode-alist
;; 	  (append
;; 	   '(("/.el" . emacs-lisp-mode))
;; 	   '(("/.emacs-*" . emacs-lisp-mode))
;; 	   '(("/.wl" . emacs-lisp-mode))
;; 	   auto-mode-alist))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     ;; hook
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     ;;    (add-hook 'slime-mode-hook 'set-up-slime-ac)
;;     ;;    (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;;     (defun my-lisp-mode-hook-func ()
;;       (interactive)
;;       (define-key lisp-mode-map "`" 'self-insert-command)
;;       (define-key lisp-mode-map "\C-c\C-i" 'auto-complete)
;;       (slime-mode t)
;;       (show-paren-mode 1)
;;       (when (require 'auto-complete nil t)
;; 	;; (require 'ac-slime nil t)
;; 	;; (setq ac-sources '(ac-source-slime-simple ac-source-words-in-same-mode-buffers))
;; 	;; (auto-complete-mode t)
;; 	)) 


;;     (add-hook 'lisp-mode-hook 'my-lisp-mode-hook-func)
;;     (add-hook 'lisp-mode-hook (lambda ()
;; 				(cond ((featurep 'slime)
;; 				       (slime-mode t) 
;; 				       auto-complete-mode
;; 				       (local-set-key "\t" 'slime-indent-and-complete-symbol)
;; 				       (global-set-key "\C-cH" 'hyperspec-lookup)
;; 				       (global-set-key "\C-\\" 'ime-onoff-slime))
;; 				      (t
;; 				       (normal-mode)))))

;;     ;;    (add-hook 'slime-mode-hook 'set-up-slime-ac)
;;     ;;    (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;;     (define-globalized-minor-mode real-global-auto-complete-mode
;;       auto-complete-mode (lambda ()
;; 			   (if (not (minibufferp (current-buffer)))
;; 			       (auto-complete-mode 1))))
;;     (real-global-auto-complete-mode t)

;;     (add-hook 'slime-mode-hook
;; 	      (lambda ()
;; 		(global-set-key "\C-cH" 'hyperspec-lookup)
;; 		(setq lisp-indent-function 'common-lisp-indent-function)
;; 		auto-complete-mode))

;;     (add-hook 'slime-connected-hook
;; 	      (lambda ()
;; 		(slime-cd "~")
;; 		auto-complete-mode))

;;     (add-hook 'inferior-lisp-mode-hook
;; 	      (lambda ()
;; 		(slime-mode t)
;; 		(inferior-slime-mode t)
;; 		(show-paren-mode)))



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     ;; インデントの設定
;;     ;; Additional definitions by Pierpaolo Bernardi.
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     (defun cl-indent (sym indent)
;;       (put sym 'common-lisp-indent-function
;; 	   (if (symbolp indent)
;; 	       (get indent 'common-lisp-indent-function)
;; 	     indent)))
;;     (cl-indent 'if '1)
;;     (cl-indent 'generic-flet 'flet)
;;     (cl-indent 'generic-labels 'labels)
;;     (cl-indent 'with-accessors 'multiple-value-bind)
;;     (cl-indent 'with-added-methods '((1 4 ((&whole 1))) (2 &body)))
;;     (cl-indent 'with-condition-restarts '((1 4 ((&whole 1))) (2 &body)))
;;     (cl-indent 'with-simple-restart '((1 4 ((&whole 1))) (2 &body)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     ;; HyperSpecをw3mで見る
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     (when (featurep 'w3m)
;;       (require 'hyperspec)
;;       (setq common-lisp-hyperspec-root
;; 	    (concat "file://"
;; 		    (expand-file-name "~/.emacs.d/HyperSpec/"))
;; 	    common-lisp-hyperspec-symbol-table
;; 	    (expand-file-name "~/.emacs.d/HyperSpec/Data/MapSym.txt"))
;;       (defadvice common-lisp-hyperspec
;; 	(around hyperspec-lookup-w3m () activate)
;; 	(let* ((window-configuration (current-window-configuration))
;; 	       (browse-url-browser-function
;; 		`(lambda (url new-window)
;; 		   (w3m-browse-url url nil)
;; 		   (let ((hs-map (copy-keymap w3m-mode-map)))
;; 		     (define-key hs-map (kbd "q")
;; 		       (lambda ()
;; 			 (interactive)
;; 			 (kill-buffer nil)
;; 			 (set-window-configuration ,window-configuration)))
;; 		     (use-local-map hs-map)))))
;; 	  ad-do-it)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;; 起動用の関数群
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;     (defun cmucl-start ()
;;       (interactive)
;;       (shell-command ""))
;;     (defun sbcl-start ()
;;       (interactive)
;;       (shell-command "sbcl --load $HOME/.slime.l &"))
;;     (defun clisp-start ()
;;       (interactive)
;;       (shell-command (format "clisp -K full -q -ansi -i %s/.slime.l &" (getenv "HOME"))))

;;     (defun slime-on (x)
;;       (progn (setq inferior-lisp-program x)
;; 	     (slime)))
;;     (defun slime-clisp ()
;;       (interactive)
;;       (slime-on "clisp"))
;;     (defun slime-sbcl ()
;;       (interactive)
;;       (slime-on "sbcl"))))
