;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; utils
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-get-date-gen (form) (insert (format-time-string form)))
(defun my-get-date () (interactive) (my-get-date-gen "%Y年%m月%d日"))
(defun my-get-time () (interactive) (my-get-date-gen "%H時%M分"))
(defun my-get-dtime () (interactive) (my-get-date-gen "%Y年%m月%d日 %H時%M分"))
(global-set-key "\C-c\C-d" 'my-get-date)
(global-set-key "\C-c\C-t" 'my-get-time)
(global-set-key "\C-c\ed" 'my-get-dtime)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; howm の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq howm-menu-schedule-days 20)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;日本語環境:UTF-8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-language-environment "Japanese")

(cond (run-unix
       (set-default-coding-systems 'utf-8)
       (set-terminal-coding-system 'utf-8)
       (set-buffer-file-coding-system 'utf-8)
       (prefer-coding-system 'utf-8-unix)
       (set-keyboard-coding-system 'utf-8))
      (run-darwin
       (set-default-coding-systems 'utf-8)
       (set-terminal-coding-system 'utf-8)
       (set-buffer-file-coding-system 'utf-8)
       (prefer-coding-system 'utf-8-unix)
       (set-keyboard-coding-system 'utf-8)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; フォントの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (set-fontset-font
;;  nil 'japanese-jisx0208
;;  (font-spec :family "Ricty"))
;; (set-face-attribute 'default nil
;;                    :family "Ricty"
;;                    )


(when (and run-emacs23 run-linux)
  (when window-system
    (progn
      (set-default-font "DejaVu Sans Mono-12")
      (set-face-font 'variable-pitch "DejaVu Sans Mono-12"))))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 見た目などの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;自動インデント設定
(require 'font-lock)
(global-font-lock-mode t)
(setq scroll-conservatively 1)

;;対応する括弧をハイライト表示させる
(show-paren-mode 1)

;;行番号を表示
(line-number-mode 1)
(column-number-mode 1)

;;メニューバーを消す
(menu-bar-mode -1)
(tool-bar-mode nil)

;;mode-lineにファイル名のフルパスを表示
(set-default 'mode-line-buffer-identification
 '(buffer-file-name ("%f") ("%b")))

;;*scratch*の文字列をなくす
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)

;;C-vなどでページ移動があってもカーソル位置を変化させない
(setq scroll-preserve-screen-position t)

;;選択範囲に色がつくように変更
(transient-mark-mode t)

;;emacsの画面をC-x-2などで分割したときにShift+矢印キーで分割ウィンドウの移動が可能
(windmove-default-keybindings)

;;key-chord
;;2つのキーの同時押し、もしくは単一キーのダブルクリックを define-key として使用できる lisp
(require 'key-chord)
(key-chord-mode t)

;;key config
(global-set-key "\C-h" 'delete-backward-char) ;C-hをbackspaseに割り当て
(global-set-key "\M-g" 'goto-line)       ;M-gをgoto-lineに割り当て
(global-set-key "\M-r" 'replace-string) ;M-rをstring-replaceに割り当て
(key-chord-define-global "^^" 'enlarge-window)
(global-set-key "\C-xf" 'describe-function)
(global-set-key "\C-xv" 'describe-variable)


(setq auto-mode-alist
      (append
       '(("\\.c$"    . c-mode)
         ("\\.h$"    . c++-mode)
         ("\\.java$" . java-mode)
         ("\\.m$"    . objc-mode)
         ("\\.c\\+\\+$" . c++-mode)
         ("\\.cpp$"  . c++-mode)
         ("\\.cc$"   . c++-mode)
         ("\\.hh$"   . c++-mode))
       auto-mode-alist))

(setq comment-style 'multi-line)

;;==============
;; gnuserv 設定
;;==============
;; (require 'gnuserv)
;; (gnuserv-start)
;; (setq gnuserv-frame (selected-frame)) ; 新しくフレームを開かない

(require 'grep)
(setq grep-command-before-query "grep -nH -r -e ")
(defun grep-default-command ()
  (if current-prefix-arg
      (let ((grep-command-before-target
             (concat grep-command-before-query
                     (shell-quote-argument (grep-tag-default)))))
        (cons (if buffer-file-name
                  (concat grep-command-before-target
                          " *."
                          (file-name-extension buffer-file-name))
                (concat grep-command-before-target " ."))
              (+ (length grep-command-before-target) 1)))
    (car grep-command)))
(setq grep-command (cons (concat grep-command-before-query " .")
                         (+ (length grep-command-before-query) 1)))
(define-key global-map (kbd "M-C-g") 'grep)   

(add-hook 'speedbar-mode-hook
          '(lambda ()
             (speedbar-add-supported-extension
	      '("js" "as" "html" "css" "php" "lisp"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Backslashes
;; バックスラッシュがうまく入力できない環境があるので
;; 強制的に対応
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key global-map [165] nil)
(define-key global-map [67109029] nil)
(define-key global-map [134217893] nil)
(define-key global-map [201326757] nil)
(define-key function-key-map [165] [?\\])
(define-key function-key-map [67109029] [?\C-\\])
(define-key function-key-map [134217893] [?\M-\\])
(define-key function-key-map [201326757] [?\C-\M-\\])

