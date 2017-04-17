;;; common.el --- emacs common settings
;;; Commentary:

;;; Code:
(defun japanese-encoding ()
  "UTF-8の日本語環境とする"
  (set-language-environment "Japanese")
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-buffer-file-coding-system 'utf-8)
  (prefer-coding-system 'utf-8-unix)
  (set-keyboard-coding-system 'utf-8)
  (when run-w32
    (setq default-file-name-coding-system
          'japanese-shift-jis-dos)))

(defun my-save-buffers-kill-emacs ()
  "終了時の確認関数"
  (interactive)
  (if (y-or-n-p "quit emacs? ")
      (save-buffers-kill-emacs)))

(defun japanese-font ()
  ;; Basic font
  (custom-set-faces
   '(default ((t (:foundry "Source Code Pro N" :family "Source Code Pro N")))))

  ;; Japanese font
  (set-fontset-font t 'japanese-jisx0208 (font-spec :family "IPAExGothic")))

;; 文字関連の設定
(japanese-encoding)
(japanese-font)

(progn
  ;; 基本設定(不要な機能を無効にする)

  ;; テキストの折り返しを無効にする
  (add-hook 'text-mode-hook 'turn-off-auto-fill)

  ;; menubar  & toolbar を消す
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (scroll-bar-mode 0)

  ;; エラー通知は鬱陶しいので切る
  (setq ring-bell-function 'ignore)

  ;; *scratch*の文字列をなくす
  (setq initial-scratch-message nil)
  (setq inhibit-startup-message t)

  ;; *.~ とかのバックアップファイルを作らない
  (setq make-backup-files nil)

  ;; .#* とかのバックアップファイルを作らない
  (setq auto-save-default nil))

;; 終了時に聞いてくるように修正
(global-set-key "\C-x\C-c"
                'my-save-buffers-kill-emacs)

;; 対応する括弧をハイライト表示させる
(show-paren-mode 1)


;; 自動インデント設定
(require 'font-lock)
(global-font-lock-mode t)
(electric-indent-mode -1)


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
(global-linum-mode)
;; 行番号を表示
(line-number-mode 0)
(column-number-mode 1)
(put 'narrow-to-region 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;key config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\C-h" 'delete-backward-char) ;C-hをbackspaseに割り当て
(global-set-key "\M-g" 'goto-line)       ;M-gをgoto-lineに割り当て
(global-set-key "\M-r" 'replace-string) ;M-rをstring-replaceに割り当て
(global-set-key [M-kanji] 'ignore)

(require 'evil)
(evil-mode 1)

(unless run-w32
  (put 'dired-find-alternate-file 'disabled nil)
  (setq dired-listing-switches "-Fla --group-directories-first")
  (exec-path-from-shell-initialize))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
