;;--------------------------
;; Macのキーボード関連
;;-------------------------

;; Mac用設定
;; CommandとOptionを入れ替える
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; クラッシュするキーバインドを無効に
(global-set-key (kbd "s-p") nil) ; ns-print-buffer
(global-set-key (kbd "s-S") nil) ; ns-write-file-using-panel
(global-set-key (kbd "s-o") nil) ; ns-open-file-using-panel
(setq use-dialog-box nil)
(setq flymake-gui-warnings-enabled nil)

;; fullscreen
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

(when (eq window-system 'mac)
  (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
  (mac-translate-from-yen-to-backslash) ;; yen => backslash
  (set-language-info "Japanese" 'input-method "MacOSX"))
