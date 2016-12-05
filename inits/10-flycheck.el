(use-package flycheck-pos-tip)
(use-package flycheck
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
