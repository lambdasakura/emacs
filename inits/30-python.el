;;; 30-python.el --- python mode
;;; Commentary:
;;; Code:
(use-package python
  :mode (("\\.py" . python-mode))
  :init
  (add-hook 'python-mode-hook
            (lambda ()
              (setq imenu-create-index-function
                    'python-imenu-create-index))))
