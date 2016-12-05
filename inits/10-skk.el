;; Configure for SKK
;; (require 'skk-autoloads)

(bind-keys ("C-x C-j" . skk-mode)
           ("C-x j" . skk-mode)
           ("C-x C-j" . skk-mode)
           ("C-x C-j" . skk-mode)
           ("C-x j" . skk-auto-fill-mode)
           ("C-x t" . skk-tutorial))

;;チュートリアルの場所設定
;; (setq skk-tut-file "~/.emacs.d/etc/skk/SKK.tut")
;;辞書ファイルの位置
;; (setq skk-large-jisyo "~/.emacs.d/etc/skk/SKK-JISYO.L")
;; skk用のstickyキー設定
(setq skk-sticky-key ";")
(setq skk-egg-like-newline t)
(setq skk-large-jisyo "~/.emacs.d/etc/skk/SKK-JISYO.L")

;; skk用のstickyキー設定
;; (setq skk-sticky-key ";")
(setq skk-extra-jisyo-file-list nil)
(setq skk-show-tooltip nil)
(setq skk-show-annotation nil)

;; 折り返しの動作は不要
(add-hook 'skk-mode-hook 'turn-off-auto-fill)
