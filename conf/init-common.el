;; 
;; emacsのglobalな設定
;; 

;; (setq gc-cons-threshold 134217728)

;; 日本語環境:for UTF-8
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)
(when run-w32 
  (setq default-file-name-coding-system 'japanese-shift-jis-dos))

;; フォントの設定
(add-to-list 'default-frame-alist '(font . "ricty-14"))

;; *scratch*の文字列をなくす
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;; 終了時に聞いてくるように修正
(defun my-save-buffers-kill-emacs ()
  (interactive)
  (if (y-or-n-p "quit emacs? ")
      (save-buffers-kill-emacs)))
(global-set-key "\C-x\C-c" 'my-save-buffers-kill-emacs)

;;対応する括弧をハイライト表示させる
;; (show-paren-mode 1)

;;行番号を表示
;; (line-number-mode 1)
;; (column-number-mode 1)

;; menubar  & toolbar を消す
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))

;; 自動インデント設定
(require 'font-lock)
(global-font-lock-mode t)

;; ポイントがスクリーンからはみ出したとき （あるいはスクロール時の余白に入ったとき）に どのように自動的にスクロールするかを制御する。
;; - 0 ウィンドウの縦方向でポイントが中央にくるように テキストをスクロールして再表示する。 
;; - 値が正の整数n ウィンドウをどちらかの方向に最大n行だけスクロールすると ポイントが見えるようになるときには、そのようにスクロールして再表示する。
;; - その他 ポイントが中央にくるようにする。 デフォルト値は0である。 
;; (setq scroll-conservatively 1)
;;C-vなどでページ移動があってもカーソル位置を変化させない
;; (setq scroll-preserve-screen-position t)

;; mode-lineにファイル名のフルパスを表示
(set-default 'mode-line-buffer-identification
	     '(buffer-file-name ("%f") ("%b")))

;; 選択範囲に色がつくように変更
(transient-mark-mode t)

;;emacsの画面をC-x-2などで分割したときにShift+矢印キーで分割ウィンドウの移動が可能
(windmove-default-keybindings)

(setq-default truncate-partial-width-windows t)
(setq-default truncate-lines t)

(setq comment-style 'multi-line)

;; cua(矩形選択) modeを使う
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; 行数を表示する
(require 'linum)
(global-linum-mode)
(put 'narrow-to-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;key config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\C-h" 'delete-backward-char) ;C-hをbackspaseに割り当て
(global-set-key "\M-g" 'goto-line)       ;M-gをgoto-lineに割り当て
(global-set-key "\M-r" 'replace-string) ;M-rをstring-replaceに割り当て

;; key-chord
;; 2つのキーの同時押し、もしくは単一キーのダブルクリックを define-key として使用できる lisp
;; (require 'key-chord)
;; (key-chord-mode t)

;; (key-chord-define-global "^^" 'enlarge-window)
;; (global-set-key "\C-xf" 'describe-function)
;; (global-set-key "\C-xv" 'describe-variable)

;; ;;==============
;; ;; gnuserv 設定
;; ;;==============
;; ;; (require 'gnuserv)
;; ;; (gnuserv-start)
;; ;; (setq gnuserv-frame (selected-frame)) ; 新しくフレームを開かない

;; (require 'grep)
;; (setq grep-command-before-query "grep -nH -r -e ")
;; (defun grep-default-command ()
;;   (if current-prefix-arg
;;       (let ((grep-command-before-target
;;              (concat grep-command-before-query
;;                      (shell-quote-argument (grep-tag-default)))))
;;         (cons (if buffer-file-name
;;                   (concat grep-command-before-target
;;                           " *."
;;                           (file-name-extension buffer-file-name))
;;                 (concat grep-command-before-target " ."))
;;               (+ (length grep-command-before-target) 1)))
;;     (car grep-command)))
;; (setq grep-command (cons (concat grep-command-before-query " .")
;;                          (+ (length grep-command-before-query) 1)))
;; (define-key global-map (kbd "M-C-g") 'grep)   

;; (add-hook 'speedbar-mode-hook
;;           '(lambda ()
;;              (speedbar-add-supported-extension
;; 	      '("js" "as" "html" "css" "php" "lisp"))))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Backslashes
;; ;; バックスラッシュがうまく入力できない環境があるので
;; ;; 強制的に対応
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (define-key global-map [165] nil)
;; (define-key global-map [67109029] nil)
;; (define-key global-map [134217893] nil)
;; (define-key global-map [201326757] nil)
;; (define-key function-key-map [165] [?\\])
;; (define-key function-key-map [67109029] [?\C-\\])
;; (define-key function-key-map [134217893] [?\M-\\])
;; (define-key function-key-map [201326757] [?\C-\M-\\])


