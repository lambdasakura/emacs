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
;; (if (file-exists-p "~/.emacs.d/conf/private.el") (load "private"))
(load "init-package")
(load "init-common")
(load "init-color")

(require 'evil)
(evil-mode 1)

(load "init-emacs-nav")
(load "init-recentf")

;; Code Completion
(load "init-auto-complete")
(load "init-yasnippet")

;; Window Management
;; (load "init-elscreen")


;; Moccur
;; (load "init-moccur")

;; Magit
;; (load "init-magit")
;; (load "init-howm")
(load "init-w3m")
(load "init-markdown")
(load "init-skk")

;; Programming Environment
(load "init-go")
;; (load "init-c")
;; (load "init-gdb")
;; (load "init-gtags")
;; (load "init-ruby")
;; (load "init-python")
(load "init-javascript")
(load "init-scala")
(load "init-slime")
(load "init-markdown")
(load "init-javascript")
;; (load "init-scala")
(load "init-popwin")
;; (load "init-haskell")
;; (load "init-clojure")
(load "init-slime")
;; (load "init-haskell")

;; ;; Extra
;; ;; (load "init-yatex")
;; ;;(load "init-caede")
;; (load "init-haskell")

;; Extra
;;(load "init-caede")
(load "init-skk")
(load "init-yatex")
(load "init-twittering")
(load "init-helm")
(load "init-whitespace")
(load "init-automode")
(load "init-server")

(if (file-exists-p "~/.emacs.d/conf/private.el") (load "private"))
(load "init-automode")

(if (file-exists-p "~/.emacs.d/conf/private.el")
    (load "private"))

(cd "~")
(load "init-server")
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-listing-switches "-Fla --group-directories-first")
(exec-path-from-shell-initialize)
