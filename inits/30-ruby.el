;;; 30-ruby.el --- Ruby mode
;;; Commentary:
;;; Code:
(use-package ruby-mode
  :mode (("\\.rb" . ruby-mode))
  :interpreter "ruby"
  :init
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (require 'ruby-electric)
               (ruby-electric-mode t))))
(provide '30-ruby)
;;; 30-ruby.el ends here
