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
(load "init-package")
(load "init-common")
(load "init-color")
(load "init-emacs-nav")
(load "init-recentf")
(load "init-auto-complete")
(load "init-yasnippet")
(load "init-moccur")
(load "init-popwin")
(load "init-skk")
(load "init-helm")
(load "init-whitespace")
(load "init-server")

;; (load "init-howm")
(load "init-w3m")
(load "init-yatex")
(load "init-markdown")

;; Programming Environment
;; (load "init-c")
;; (load "init-gdb")
;; (load "init-gtags")
;; (load "init-ruby")
;; (load "init-python")
;; (load "init-clojure")
;; (load "init-haskell")
(load "init-javascript")
(load "init-scala")
(load "init-slime")
(load "init-go")

;; Extra
;;(load "init-caede")
(load "init-twittering")
(load "init-automode")

(if (file-exists-p "~/.emacs.d/conf/private.el")
    (load "private"))

(cd "~")
