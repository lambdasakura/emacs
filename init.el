;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs setting file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
(load "init-package")
(load "init-common")
(load "init-color")

(require 'evil)
(evil-mode 1)

(load "init-emacs-nav")
(load "init-recentf")

;; Code Completion
(load "init-auto-complete")
;; (load "init-yasnippet")

;; Window Management
(load "init-elscreen")
(load "init-popwin")

;; Moccur
;; (load "init-moccur")

;; Magit
;; (load "init-magit")
;; (load "init-howm")
(load "init-w3m")

;; Programming Environment

;; (load "init-c")
;; (load "init-gdb")
;; (load "init-gtags")
;; (load "init-ruby")
;; (load "init-python")
;; (load "init-markdown")
;; (load "init-javascript")
;; (load "init-haskell")
(load "init-slime")

;; Extra
;; (load "init-yatex")
;;(load "init-caede")
(load "init-helm")
(load "init-whitespace")
(load "init-skk")

(if (file-exists-p "~/.emacs.d/conf/private.lisp") (load "private"))

(cd "~")
