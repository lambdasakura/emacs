;; Mac用設定
(when run-darwin
  (defun toggle-fullscreen ()
    (interactive)
    (set-frame-parameter nil
                         'fullscreen
                         (if (frame-parameter nil 'fullscreen)
                             nil
                           'fullboth)))

  ;; CommandとOptionを入れ替える
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
  (setq use-dialog-box nil)

  ;; クラッシュするキーバインドを無効に
  (bind-keys ("s-p" . nil)
             ("s-S" . nil)
             ("s-o" . nil)
             ("[(meta return)]" 'toggle-fullscreen))

  (when (eq window-system 'mac)
    (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
    (mac-translate-from-yen-to-backslash) ;; yen => backslash
    (set-language-info "Japanese" 'input-method "MacOSX")))
