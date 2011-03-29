(add-to-load-path "~/.emacs.d/elisp/yasnippet/")
(require 'yasnippet)
(setq yas/trigger-key " ")
(setq yas/field-highlight-face t)

;; (add-hook 'yas/before-expand-snippet-hook
;;           (lambda ()
;;             (auto-complete-mode)))

;; (add-hook 'yas/after-exit-snippet-hook
;;           (lambda ()
;;             (auto-complete-mode)))


(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")