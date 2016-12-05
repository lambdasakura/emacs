;;; 30-javascript.el --- web-mode settings
;;; Commentary:
;;; Code:
(use-package web-mode
  :mode (("\\.jsx" . web-mode)
         ("\\.js" . web-mode))
  :init
  (add-hook 'web-mode-hook
            (lambda ()
              (when (equal web-mode-content-type "jsx")
                (flycheck-add-mode 'javascript-eslint 'web-mode)
                (flycheck-mode))))
  (add-hook 'web-mode-hook
            (lambda ()
              (setq web-mode-attr-indent-offset nil)
              (setq web-mode-markup-indent-offset 2)
              (setq web-mode-css-indent-offset 2)
              (setq web-mode-code-indent-offset 2)
              (setq web-mode-sql-indent-offset 2)
              (setq indent-tabs-mode nil)
              (setq tab-width 2))))

(provide '30-javascript)
;;; 30-javascript.el ends here
