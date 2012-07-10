;; for python
(add-to-list 'load-path "~/.emacs.d/elisp/Pymacs-0.23")
(autoload 'python-mode "python-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-hook 'python-mode-hook
          '(lambda()
             (require 'pycomplete)
             (setq indent-tabs-mode nil)))
;; (add-hook 'python-mode-hook (lambda () (local-set-key "\M-/" 'py-complete)))
