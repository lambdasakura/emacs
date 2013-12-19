;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs setting file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

(add-to-load-path "~/.emacs.d"
 		  "~/.emacs.d/elisp"
 		  "~/.emacs.d/conf"
 		  "~/.emacs.d/elisp/howm-1.4.0")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Loading elisps
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic Settings
;; (when run-darwin (load "init-mac"))
(load "init-utils")
(load "init-package")
(load "init-common")
(load "init-color")

(load "init-emacs-nav")
(load "init-recentf")

;; Code Completion
(load "init-auto-complete")
(load "init-yasnippet")

;; Window Management 
(load "init-elscreen")
;; (load "init-popwin")

;; Moccur
(load "init-moccur")

;; Magit
(load "init-magit")

;; (load "init-networking")
(load "init-howm")
;; (load "init-w3m")

;; Programming Environment

;; (load "init-c")
;; (load "init-gdb")
;; (load "init-gtags")
(load "init-ruby")
(load "init-python")
(load "init-markdown")
(load "init-javascript")
(load "init-slime")
(load "init-haskell")

;; Extra
;; (load "init-yatex")
;;(load "init-caede")

(load "init-helm")
(require 'evil)
(evil-mode 1)

(cd "~")
