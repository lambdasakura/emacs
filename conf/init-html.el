;; html-helper-mode
(require 'html-helper-mode)
(setq auto-mode-alist
      (append '(("\\.html?$" . html-helper-mode)
		("\\.tt$" . html-helper-mode))
	      auto-mode-alist))
(add-hook 'html-helper-mode-hook
          '(lambda()
	     (font-lock-mode 1)
	     (abbrev-mode nil)))

(setq html-helper-build-new-buffer nil)
