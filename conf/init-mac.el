;;--------------------------
;; Macのキーボード関連
;;-------------------------
;;(mac-add-ignore-shortcut '(control));; Control + すべてのキー　を無視する
;;(mac-add-ignore-shortcut '(control))
;;(setq mac-command-modifier 'meta)
;;(setq mac-option-modifier 'meta)
;;(mac-add-ignore-shortcut '(command))

;; Mac用設定
;; http://www.pqrs.org/~tekezo/macosx/doc/unix/
(setq mac-command-key-is-meta t)
(setq mac-command-modifier-meta t)
(setq mac-option-modifier 'meta)
(setq grep-find-use-xargs 'bsd)
(setq browse-url-generic-program "open")
;;(setq initial-frame-alist '((width . 177) (height . 47) (top . 0) (left . 0)))

;; Ctrl/Cmd/Optionがシステムに渡されるのを防ぐ
;;(setq mac-pass-control-to-system nil)
;;(setq mac-pass-command-to-system nil)
;;(setq mac-pass-option-to-system nil)

;; 半透明化パッチ適用
;; http://homepage.mac.com/matsuan_tamachan/emacs/TransparencyPatch.html
;;(setq default-frame-alist
;;      (append (list '(alpha . (90 90))) default-frame-alist))

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


;; path
(defvar system-load-path load-path)
(setq my-load-path '("/usr/share/emacs/22.1/site-lisp/skk" 
		     "/usr/share/emacs/22.1/site-lisp/apel" 
		     "/usr/share/emacs/22.1/site-lisp/emu"))
(setq load-path (append my-load-path system-load-path))
(setq skk-large-jisyo "/Users/sakura/SKK-JISYO.L")
(setq skk-tut-file "/usr/share/skk/SKK.tut")
