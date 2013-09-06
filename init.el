;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs 設定ファイル
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Warning: `mapcar' called for effect; use `mapc' or `dolist' instead
(setq warning-suppress-types nil)
(setq byte-compile-warnings '(free-vars 
			      unresolved 
			      callargs
			      redefine 
			      obsolete 
			      noruntime 
			      cl-functions 
			      interactive-only 
			      make-local))

(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

(add-to-load-path "~/.emacs.d"
		  "~/.emacs.d/elisp"
		  "~/.emacs.d/elisp/emacs-nav"
		  "~/.emacs.d/conf"
		  "/usr/local/share/emacs/site-lisp"
		  "~/.emacs.d/elisp/emacs-w3m/"
		  "~/.emacs.d/elisp/howm-1.4.0"
		  "~/Program/magit/"
		  "~/Program/git-mode/")

(load "init-utils")

;; for Mac
(when run-darwin
  (load "init-mac"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Loading elisps
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cd "~")

(load "init-common")
(load "init-package")
(load "init-color")
(load "init-howm")
(load "init-emacs-nav")
(load "init-anything")
(load "init-auto-complete")
(load "init-networking")

;; utils
(load "init-elscreen")
(load "init-yasnippet")
(load "init-moccur")
(load "init-popwin")

;; (load "init-w3m")
;; (load "init-slime")


;; Programming Environment
(load "init-magit")
(load "init-haskell")
;; (load "init-ruby")
;; (load "init-python")

;; (load "init-c")
;; (load "init-gdb")
;; (load "init-gtags")

;; Extra

;; (load "init-yatex")
;;(load "init-caede")
