(use-package haskell-mode
  :mode (("\\.hs" . haskell-mode))
  :init
  (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
  (add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
  (setq haskell-program-name "ghci"))
(use-package ghc
  :init
  (autoload 'ghc-init "ghc" nil t)
  (add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode))))

(use-package haskell-cabal)
