;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs 設定ファイル
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Warning: `mapcar' called for effect; use `mapc' or `dolist' instead
;; (setq warning-suppress-types nil)
;; (setq byte-compile-warnings '(free-vars 
;; 			      unresolved 
;; 			      callargs
;; 			      redefine 
;; 			      obsolete 
;; 			      noruntime 
;; 			      cl-functions 
;; 			      interactive-only 
;; 			      make-local))

(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

(add-to-load-path "~/.emacs.d"
 		  "~/.emacs.d/elisp"
 		  "~/.emacs.d/conf"
 		  "~/.emacs.d/elisp/howm-1.4.0")



;; ;; for Mac
;; (when run-darwin
;;   (load "init-mac"))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Loading elisps
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq gc-cons-threshold 134217728)

(load "init-package")
(load "init-common")
(load "init-color")
(load "init-utils")
(load "init-emacs-nav")
(load "init-auto-complete")
(load "init-yasnippet")
(load "init-elscreen")
(load "init-magit")
(load "init-ruby")
(load "init-python")

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command "multimarkdown"))
(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))

;; javascript
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(autoload 'js3-mode "js3" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

(require 'recentf)
(setq recentf-save-file "~/.recentf")
(setq recentf-max-menu-items 20)
(setq recentf-max-saved-items 100)
(recentf-mode 1)

(require 'helm-config)
(require 'helm-command)
(require 'helm-descbinds)

(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x rl") 'helm-bookmarks)
(global-set-key (kbd "C-M-o") 'helm-occur) 

(helm-mode 1)


(setq helm-idle-delay             0.1
      helm-input-idle-delay       0.1
      helm-candidate-number-limit 200)

(let ((key-and-func
       `((,(kbd "C-r")   helm-for-files)
         (,(kbd "C-^")   helm-c-apropos)
         (,(kbd "C-l")   helm-bookmarks)
         (,(kbd "C-;")   helm-resume)
         (,(kbd "M-s")   helm-occur)
         (,(kbd "M-x")   helm-M-x)
         (,(kbd "M-y")   helm-show-kill-ring)
         (,(kbd "M-z")   helm-do-grep)
         (,(kbd "C-S-;") helm-descbinds)
        )))
  (loop for (key func) in key-and-func
        do (global-set-key key func)))



;; (load "init-howm")
;; (load "init-networking")
;; ;; utils
;; (load "init-moccur")
;; (load "init-popwin")

;; ;; (load "init-w3m")
;; (load "init-slime")

;; ;; Programming Environment

;; (load "init-haskell")

;; (load "init-c")
;; (load "init-gdb")
;; (load "init-gtags")

;; Extra

;; (load "init-yatex")
;;(load "init-caede")
(cd "~")
