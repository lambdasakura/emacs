;;---------------------------------------------------
;; Ruby関連
;;---------------------------------------------------
;; (require 'inf-ruby)
(custom-set-faces '(flymake-errline ((((class color)) (:background "firebrick")))) 
		  '(flymake-warnline ((((class color)) (:background "IndianRed"))))) 

(custom-set-faces '(flymake-errline ((((class color)) (:background "blue")))) 
		  '(flymake-warnline ((((class color)) (:background "blue"))))) 

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)

(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist)) 

(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))
;; (add-to-list 'ruby-encoding-map '(japanese-cp932 . cp932))

;; (require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
