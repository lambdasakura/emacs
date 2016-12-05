;;; 30-go.el --- golang settings
;;; Commentary:
;;; Code:
(use-package go-mode
  :mode (("\\.go" . go-mode))
  :init
  (add-hook 'go-mode-hook 'flycheck-mode))
(provide '30-go)
;;; 30-go.el ends here
