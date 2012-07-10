;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; php-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-load-path "~/.emacs.d/elisp/php-mode")
(defcustom php-file-patterns (list "\\.php[s34]?\\'" "\\.phtml\\'" "\\.inc\\'")
  "*List of file patterns for which to automatically invoke php-mode."
  :type '(repeat (regexp :tag "Pattern"))
  :group 'php)
(load-library "php-mode")
(autoload 'php-mode "php-mode" "PHP mode" t)
(add-hook 'php-mode-user-hook
          '(lambda ())
          (setq c-basic-offset 4)
          (setq indent-tabs-mode nil))

(let ((php-file-patterns-temp php-file-patterns))
  (while php-file-patterns-temp
    (add-to-list 'auto-mode-alist
                 (cons (car php-file-patterns-temp) 'php-mode))
    (setq php-file-patterns-temp (cdr php-file-patterns-temp))))
