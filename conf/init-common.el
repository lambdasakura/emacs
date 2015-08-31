;;
;; emacsのglobalな設定
;;

;; エラー通知は鬱陶しいので切る
(setq ring-bell-function 'ignore)

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
(when run-linux
  (add-to-list 'default-frame-alist '(font . "ricty-12")))
(when run-w32
  (add-to-list 'default-frame-alist '(font . "源ノ角ゴシック Code JP R-11")))

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
(show-paren-mode 1)

;; menubar  & toolbar を消す
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; 自動インデント設定
(require 'font-lock)
(global-font-lock-mode t)

;; テキストの折り返しを無効にする
(add-hook 'text-mode-hook 'turn-off-auto-fill)

(electric-indent-mode -1)

;; ポイントがスクリーンからはみ出したとき （あるいはスクロール時の余白に入ったとき）に どのように自動的にスクロールするかを制御する。
;; - 0 ウィンドウの縦方向でポイントが中央にくるように テキストをスクロールして再表示する。
;; - 値が正の整数n ウィンドウをどちらかの方向に最大n行だけスクロールすると ポイントが見えるようになるときには、そのようにスクロールして再表示する。
;; - その他 ポイントが中央にくるようにする。 デフォルト値は0である。
;; (setq scroll-conservatively 1)
;; C-vなどでページ移動があってもカーソル位置を変化させない
;; (setq scroll-preserve-screen-position t)

;; mode-lineにファイル名のフルパスを表示
(set-default 'mode-line-buffer-identification '(buffer-file-name ("%f") ("%b")))

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
;; (require 'linum)
;; (global-linum-mode)
;; 行番号を表示
;; (line-number-mode 0)
;; (column-number-mode 1)
(put 'narrow-to-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;key config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\C-h" 'delete-backward-char) ;C-hをbackspaseに割り当て
(global-set-key "\M-g" 'goto-line)       ;M-gをgoto-lineに割り当て
(global-set-key "\M-r" 'replace-string) ;M-rをstring-replaceに割り当て
(global-set-key [M-kanji] 'ignore)


;;; 言語環境の指定
(when run-linux
  ;;mozcの設定
  (require 'mozc)
  (set-language-environment "Japanese")
  (setq default-input-method "japanese-mozc")

  ;;ドル記号を入力したときに直接入力に切り替える。
  (define-key mozc-mode-map "$" 'YaTeX-insert-dollar-or-mozc-insert)
  (defun YaTeX-insert-dollar-or-mozc-insert ()
    (interactive)
    (if (eq major-mode 'yatex-mode)
        (YaTeX-insert-dollar)
      (mozc-insert))))
