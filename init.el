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
;; (load "init-w3m")

;; Programming Environment

(load "init-c")
;; (load "init-gdb")
(load "init-gtags")
;; (load "init-ruby")
;; (load "init-python")
(load "init-markdown")
;; (load "init-javascript")
(load "init-scala")
(load "init-slime")
(load "init-popwin")
;; (load "init-haskell")

;; ;; Extra
;; ;;(load "init-caede")
(load "init-skk")
(load "init-slime")
;; (load "init-haskell")

;; Extra
(load "init-yatex")
;;(load "init-caede")
(load "init-helm")
(load "init-whitespace")
(load "init-automode")

(if (file-exists-p "~/.emacs.d/conf/private.lisp") (load "private"))

(cd "~")

(add-hook 'text-mode-hook 'turn-off-auto-fill)
(add-hook 'skk-mode-hook 'turn-off-auto-fill)

(electric-indent-mode -1)
;; (setq next-line-add-newlines nil)
