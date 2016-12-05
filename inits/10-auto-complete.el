;;; 10-auto-complete --- auto-complete
;;; Commentary:

;;; Code:

(use-package ac-slime)
(use-package go-autocomplete)
(use-package auto-complete-config
  :config
  (ac-config-default)
  (ac-set-trigger-key "TAB")
  (setq ac-auto-show-menu t)
  ;; setup auto-complete
  (add-to-list 'ac-modes 'slime-repl-mode)
  (add-hook 'slime-mode-hook 'set-up-slime-ac)
  (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

  (bind-keys :map ac-complete-mode-map
             ("C-n" . ac-next)
             ("C-p" . ac-previous)))
