;;Warning: `mapcar' called for effect; use `mapc' or `dolist' instead を防ぐ
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
  "ロードパスにpathを追加する" 
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

(add-to-load-path "~/.emacs.d/elisp" "~/.emacs.d/conf")
(add-to-load-path "/usr/local/share/emacs/site-lisp")

;; Initialize auto-install
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")

;; Detect OS
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

;; Detect Emacsen 
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

;; Woman 
(setq woman-manpath '("/opt/local/share/man"
		      "/usr/local/share/man"
		      "/usr/share/man"
		      "/usr/X11/man"))
(setq woman-use-own-frame nil)
(setq man-use-own-frame nil)

;; Meadow
(when run-meadow
  (load "init-meadow"))

;; for Debian
(when (boundp 'debian-emacs-flavor)
  (defadvice find-function-search-for-symbol (around debian activate)
    ""
    (if (string-match (symbol-name debian-emacs-flavor) library)
        (setq library (replace-match "emacs" nil nil library)))
    ad-do-it))

;; for Mac
(when run-darwin
  (load "init-mac"))

;; Loading elisps
(load "init-common")
(load "init-networking")

;; utils
(load "init-sense-region")
(load "init-keymap")
(load "init-killring")
(load "init-color")
;;(load "init-elscreen")
(load "init-anything")
;;(load "init-migemo")
(load "init-yasnippet")
(load "init-hatena")

;; Programming Environment
(load "init-c")
(load "init-global")
(load "init-html")
(load "init-css")
(load "init-php")
(load "init-javascript")
(load "init-mmm")
(load "init-scala")
;;(load "init-js2")
;; (load "init-ruby")
;; (load "init-scheme")
(load "init-python")
(load "init-slime")
(load "init-weblogger")

;; Extra
;;(load "init-skk")
;;(load "init-dired")
(load "init-dabbrev-ja")
(load "init-hiki")
;;(load "init-hilighting")
;;(load "init-yatex")
(load "init-w3m")
;;(load "init-linkd")
;;(load "init-caede")

;;;; フォントの設定
(when (and run-emacs23 run-linux)
  (when window-system
    (progn
      (set-default-font "DejaVu Sans Mono-12")
      (set-face-font 'variable-pitch "DejaVu Sans Mono-12") ;tooltipとtabbarのフォント
      )))

(when (eq system-type 'darwin)
  (if (>= emacs-major-version 23)
      (cond (window-system
	     (create-fontset-from-ascii-font "Menlo-12:weight=normal:slant=normal" nil "menlomarugo")
	     (set-fontset-font "fontset-menlomarugo"
			       'unicode
			       (font-spec :family "Hiragino Maru Gothic ProN" :size 14)
			       nil
			       'append)
	     (add-to-list 'default-frame-alist '(font . "fontset-menlomarugo"))))))

(custom-set-faces
 '(default ((t (:inherit nil 
			 :stipple nil
			 :background "black"
			 :foreground "#cccccc" 
			 :inverse-video nil
			 :box nil 
			 :strike-through nil 
			 :overline nil 
			 :underline nil 
			 :slant normal 
			 :weight normal
			 :height 122 
			 :width normal
			 :foundry "unknown" 
			 :family "TakaoExゴシック")))))

;; その他の設定
(custom-set-variables
 '(column-number-mode t)
 '(menu-bar-mode nil)
 '(safe-local-variable-values (quote ((package . asdf))))
 '(show-paren-mode t))




