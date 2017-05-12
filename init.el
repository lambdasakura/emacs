;;;  init.el --- Emacs Setting file
;;; Commentary:
;;; Author: lambda_sakura <lambda.sakura@gmail.com>

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(helm-ff-auto-update-initial-value nil)
 '(package-selected-packages
   (quote
    (exec-path-from-shell flycheck-pos-tip flycheck go-eldoc go-autocomplete go-mode popwin evil ac-slime twittering-mode ac-cider cider clojure-mode ruby-electric ruby-block jedi ensime scala-mode yaml-mode google-c-style haskell-mode js2-mode web-mode sass-mode php-mode inf-ruby neotree all-ext w3m color-moccur deferred yasnippet yatex quickrun powerline helm-c-yasnippet helm-c-moccur helm-gtags helm-descbinds helm atom-one-dark-theme auto-complete markdown-mode dired+ init-loader bind-key use-package slack))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 96 :width normal :foundry "ADBE" :family "Source Code Pro")))))
