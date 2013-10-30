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
(cd "~")

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

(require 'helm-config)
(helm-mode 1)

;; (load "init-anything")
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
