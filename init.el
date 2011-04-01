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
;;(auto-install-update-emacswiki-package-name t)

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

;; Woman 
(setq woman-manpath '("/opt/local/share/man"
		      "/usr/local/share/man"
		      "/usr/share/man"
		      "/usr/X11/man"))
(setq woman-use-own-frame nil)
(setq man-use-own-frame nil)

;; Loading elisps
(when run-darwin
  (load "init-mac"))
(load "init-common")

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


(defun proxy-on ()
  "PROXY_SERVERを設定する。
NO_PROXYが正しく動作するのか未検証
url-proxy-servicesあたりをいじるとNO_PROXYの設定もうまくいくかも。"
  (interactive)
  (setenv "HTTP_PROXY" "http://proxy.rdc.toshiba.co.jp:8080/")
  (setenv "NO_PROXY" "localhost,127.0.0.0/8,*.toshiba.co.jp,*.toshiba.local")
  (setq http-proxy-server "proxy.rdc.toshiba.co.jp"
	http-proxy-port "8080"
	url-proxy-services
	'(("http" . "proxy.rdc.toshiba.co.jp:8080")
	  ("https" . "proxy.rdc.toshiba.co.jp:8080"))))
(defun proxy-off ()
  "PROXY_SERVERを解除する。"
  (interactive)
  (setenv "HTTP_PROXY" "")
  (setenv "NO_PROXY" "")
  (setq http-proxy-server nil
	http-proxy-port nil
	url-proxy-services nil	))

(when (and run-emacs23 run-linux)
  (when window-system
    (progn
      (set-default-font "DejaVu Sans Mono-12")
      (set-face-font 'variable-pitch "DejaVu Sans Mono-12") ;tooltipとtabbarのフォント
      ;; (set-fontset-font (frame-parameter nil 'font)
      ;; 			'japanese-jisx0208
      ;; 			'("M+2VM+IPAG circle" . "unicode-bmp"))
)))


(custom-set-variables
 '(column-number-mode t)
 '(menu-bar-mode nil)
 '(show-paren-mode t))

(custom-set-faces
 '(default 
    ((t
      (:inherit nil 
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
