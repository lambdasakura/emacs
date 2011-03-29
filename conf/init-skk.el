;; Configure for SKK
(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)
(global-set-key "\C-xj" 'skk-auto-fill-mode)
(global-set-key "\C-xt" 'skk-tutorial)
;; Specify dictionary location
(when run-darwin
  (setq skk-large-jisyo "/Users/sakura/SKK-JISYO.L"))
(when run-w32
  (setq skk-large-jisyo "C:/dic/SKK-JISYO.L"))

(setq skk-egg-like-newline t)	
(add-hook 'isearch-mode-hook
	  (function (lambda ()
		      (and (boundp 'skk-mode) skk-mode
			   (skk-isearch-mode-setup)))))

(add-hook 'isearch-mode-end-hook
	  (function
	   (lambda ()
	     (and (boundp 'skk-mode) skk-mode (skk-isearch-mode-cleanup))
	     (and (boundp 'skk-mode-invoked) skk-mode-invoked
		  (skk-set-cursor-properly)))))

(setq skk-egg-like-newline t)
