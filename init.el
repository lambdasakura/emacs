;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs setting file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'package-desc-vers 'package--ac-desc-version)

(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

(add-to-load-path "~/.emacs.d/lisp/skk"
                  "~/.emacs.d/elisp"
                  "~/.emacs.d/conf"
                  "~/.emacs.d/elisp/howm-1.4.0")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Loading elisps
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic Settings

(load "init-utils")
(if (file-exists-p "~/.emacs.d/conf/private.el") (load "private"))
(load "init-package")
(load "init-common")
(load "init-color")

(require 'evil)
(evil-mode 1)

(load "init-emacs-nav")
(load "init-recentf")

;; Code Completion
;; (load "init-auto-complete")
;; (load "init-yasnippet")

;; Window Management
;; (load "init-elscreen")


;; Moccur
;; (load "init-moccur")

;; Magit
;; (load "init-magit")
;; (load "init-howm")
(load "init-w3m")

;; Programming Environment

(load "init-c")
;; (load "init-gdb")
;; (load "init-gtags")
;; (load "init-ruby")
;; (load "init-python")
(load "init-markdown")
;; (load "init-javascript")
(load "init-scala")
(load "init-slime")
(load "init-popwin")
;; (load "init-haskell")
;; (load "init-clojure")

;; Extra
;;(load "init-caede")
(load "init-skk")
(load "init-yatex")
(load "init-twittering")
(load "init-helm")
(load "init-whitespace")
;; (load "init-automode")
(load "init-server")

(if (file-exists-p "~/.emacs.d/conf/private.el") (load "private"))

(cd "~")
(add-hook 'text-mode-hook 'turn-off-auto-fill)
(add-hook 'skk-mode-hook 'turn-off-auto-fill)

(electric-indent-mode -1)
;; (setq next-line-add-newlines nil)
(load-file "~/.emacs.d/ProofGeneral/ProofGeneral-4.2/generic/proof-site.el")
(defadvice coq-mode-config (after deactivate-holes-mode () activate)
  "Deactivate holes-mode when coq-mode is activated."
  (progn  (show-paren-mode -1)(holes-mode 0)))
(add-hook 'proof-mode-hook
   '(lambda ()
      (define-key proof-mode-map (kbd "C-c C-j") 'proof-goto-point)))
