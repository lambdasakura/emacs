;;;  init.el --- Emacs Setting file
;;; Commentary:
;;; Author: lambda_sakura <lambda.sakura@gmail.com>

;;; Code:

(defun add-to-load-path (&rest paths)
  (mapc #'(lambda (path)
            (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

(add-to-load-path "~/.emacs.d/lisp/skk"
                  "~/.emacs.d/elisp"
                  "~/.emacs.d/conf")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setup basic settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "init-utils")
(load "init-package")

(defconst inits-dir (concat user-emacs-directory "inits"))
(when (require 'init-loader nil t)
  (setq init-loader-show-log-after-init 'error-only)
  (when (file-directory-p (symbol-value 'inits-dir))
    (init-loader-load inits-dir)))

;; ;; Programming Environment
;; ;; (load "init-c")
;; ;; (load "init-gdb")
;; ;; (load "init-gtags")
;; ;; (load "init-ruby")
;; ;; (load "init-python")
;; ;; (load "init-clojure")
;; ;; (load "init-haskell")
;; ;; (load "init-java")
;; (load "init-javascript")
;; ;; (load "init-scala")
;; (load "init-slime")
;; (load "init-go")

;; ;; Extra
;; ;;(load "init-caede")
;; (load "init-twittering")
;; (load "init-slack")
;; (load "init-automode")

;; (if (file-exists-p "~/.emacs.d/conf/private.el")
;;     (load "private"))

(provide 'init)
;;; init.el ends here
