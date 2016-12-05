(use-package ac-cider
  :config
  (progn (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
         (add-hook 'cider-mode-hook 'ac-cider-setup)
         (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
         (eval-after-load "auto-complete"
           '(progn
              (add-to-list 'ac-modes 'cider-mode)
              (add-to-list 'ac-modes 'cider-repl-mode)))))
