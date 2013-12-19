(require 'haskell-mode)
(require 'haskell-cabal)

(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; (add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))

;; (add-to-list 'exec-path "C:/Users/f9078010.TOSHIBA/AppData/Roaming/cabal/bin")
;; (add-to-list 'load-path "C:/Users/f9078010.TOSHIBA/AppData/Roaming/cabal/ghc-mod-2.0.3")

;; (autoload 'ghc-init "ghc" nil t)
;; (add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))


;; (ac-define-source ghc-mod
;;   '((depends ghc)
;;     (candidates . (ghc-select-completion-symbol))
;;     (symbol . "s")
;;     (cache)))

;; (defun my-ac-haskell-mode ()
;;   (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-dictionary ac-source-ghc-mod)))
;; (add-hook 'haskell-mode-hook 'my-ac-haskell-mode)

;; (defun my-haskell-ac-init ()
;;   (when (member (file-name-extension buffer-file-name) '("hs" "lhs"))
;;     (auto-complete-mode t)
;;     (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-dictionary ac-source-ghc-mod))))

;; (add-hook 'find-file-hook 'my-haskell-ac-init)
