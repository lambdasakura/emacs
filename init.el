;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs 設定ファイル
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Warning: `mapcar' called for effect; use `mapc' or `dolist' instead
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initialize package.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-load-path "~/.emacs.d/elisp" "~/.emacs.d/conf")
(add-to-load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

(require 'package)

; Add package-archives
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) ; ついでにmarmaladeも追加

; Initialize
(package-initialize)

; melpa.el
(require 'melpa)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Detect OS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar run-unix
  (or (equal system-type 'gnu/linux)
      (or (equal system-type 'usg-unix-v)
          (or  (equal system-type 'berkeley-unix)
               (equal system-type 'cygwin)))))
(defvar run-linux
  (equal system-type 'gnu/linux))
(defvar run-system-v
  (equal system-type 'usg-unix-v))
(defvar run-bsd
  (equal system-type 'berkeley-unix))
(defvar run-cygwin 
  (equal system-type 'cygwin))
(defvar run-w32
  (and (null run-unix)
       (or (equal system-type 'windows-nt)
           (equal system-type 'ms-dos))))
(defvar run-darwin (equal system-type 'darwin))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Detect Emacsen 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar run-emacs20
  (and (equal emacs-major-version 20)
       (null (featurep 'xemacs))))
(defvar run-emacs21
  (and (equal emacs-major-version 21)
       (null (featurep 'xemacs))))
(defvar run-emacs22
  (and (equal emacs-major-version 22)
       (null (featurep 'xemacs))))
(defvar run-emacs23
  (and (equal emacs-major-version 23)
       (null (featurep 'xemacs))))
(defvar run-meadow (featurep 'meadow))
(defvar run-meadow1 (and run-meadow run-emacs20))
(defvar run-meadow2 (and run-meadow run-emacs21))
(defvar run-meadow3 (and run-meadow run-emacs22))
(defvar run-xemacs (featurep 'xemacs))
(defvar run-xemacs-no-mule
  (and run-xemacs (not (featurep 'mule))))
(defvar run-carbon-emacs (and run-darwin window-system))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for Debian
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (when (boundp 'debian-emacs-flavor)
;;   (defadvice find-function-search-for-symbol (around debian activate)
;;     ""
;;     (if (string-match (symbol-name debian-emacs-flavor) library)
;;         (setq library (replace-match "emacs" nil nil library)))
;;     ad-do-it))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for Mac
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when run-darwin
  (load "init-mac"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Loading elisps
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "init-common")
(load "init-color")

(cua-mode t)
(setq cua-enable-cua-keys nil)

;; (load "init-networking")

;; utils
(load "init-elscreen")
(load "init-anything")
(load "init-yasnippet")
(load "init-auto-complete")
(load "init-moccur")
(load "init-popwin")

(load "init-w3m")
(load "init-slime")
(load "init-ac-slime")

;; ;; Programming Environment
(load "init-c")
(load "init-gdb")
(load "init-gtags")

;; Web Programming
;; (load "init-html")
;; (load "init-css")
;; (load "init-php")
;; (load "init-mmm")

;; (load "init-scala")
;; (load "init-ruby")
;; (load "init-python")

;; Extra

;; (load "init-yatex")
;;(load "init-caede")

;; その他の設定
(setq-default truncate-partial-width-windows t)
(setq-default truncate-lines t)

(require 'linum)
(global-linum-mode)
(put 'narrow-to-region 'disabled nil)


(defun my-save-buffers-kill-emacs ()
  (interactive)
  (if (y-or-n-p "quit emacs? ")
      (save-buffers-kill-emacs)))
(global-set-key "\C-x\C-c" 'my-save-buffers-kill-emacs)
