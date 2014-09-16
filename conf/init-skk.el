;; Configure for SKK
(require 'skk-autoloads)
(global-set-key (kbd "C-x C-j") 'skk-mode)
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)

;;チュートリアルの場所設定
(setq skk-tut-file "~/.emacs.d/etc/skk/SKK.tut")
;;辞書ファイルの位置
(setq skk-large-jisyo "~/.emacs.d/etc/skk/SKK-JISYO.L")
;; skk用のstickyキー設定
(setq skk-sticky-key ";")

;; Specify dictionary location
(when run-darwin
  (setq skk-large-jisyo "/Users/sakura/SKK-JISYO.L"))

(setq skk-egg-like-newline t)

(add-hook 'isearch-mode-hook
          (function (lambda ()
                      (and (boundp 'skk-mode) skk-mode
                           (skk-isearch-mode-setup)))))

(add-hook 'isearch-mode-end-hook
          (function
           (lambda ()
             (and (boundp 'skk-mode) skk-mode (skk-isearch-mode-cleanup))
             (and (boundp 'skk-mode-invoked) skk-mode-invoked
                  (skk-set-cursor-properly)))))
