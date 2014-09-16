;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setup load-path and autoloads
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/slime")
(require 'slime-autoloads)
(require 'slime)
;; (require 'slime-annot)

(defun slime-repl-bol-insert ()
  (interactive)
  (slime-repl-bol)
  (evil-insert 1))

(when run-w32
  (setq slime-lisp-implementations
        `((sbcl ("sbcl") :coding-system utf-8-unix)
          (ccl ("C:/ccl/wx86cl.exe") :coding-system utf-8-unix))))
(when run-darwin
  (setq slime-lisp-implementations
        `((sbcl ("/usr/local/bin/sbcl") :coding-system utf-8-unix))))
(when run-linux
  (setq slime-lisp-implementations
        `((sbcl ("sbcl") :coding-system utf-8-unix)
          (ccl ("~/bin/ccl") :coding-system utf-8-unix)
          (clisp ("clisp") :coding-system utf-8-unix))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slime自体の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq slime-net-coding-system 'utf-8-unix)
(setq slime-truncate-lines 't)
(setq inferior-lisp-program 'sbcl)

(setq slime-contribs '(slime-banner slime-fancy slime-autodoc))
(slime-setup slime-contribs)

(eval-after-load "slime"
  (lambda () (define-key evil-normal-state-map "I" 'slime-repl-bol-insert)))

;; emacs lisp用のlisp-modeはemacs-lisp-modeを使用する設定に
(setq auto-mode-alist
      (append '(("/.el" . emacs-lisp-mode))
              '(("/.emacs-*" . emacs-lisp-mode))
              '(("/.wl" . emacs-lisp-mode))
              auto-mode-alist))

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

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
