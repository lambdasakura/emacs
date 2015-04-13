;;---------------------------------------------------
;; Ruby関連
;;---------------------------------------------------
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))
;; (require 'inf-ruby)
(custom-set-faces '(flymake-errline ((((class color)) (:background "firebrick"))))
                  '(flymake-warnline ((((class color)) (:background "IndianRed")))))

(custom-set-faces '(flymake-errline ((((class color)) (:background "blue"))))
                  '(flymake-warnline ((((class color)) (:background "blue")))))

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)



(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))
;; (add-to-list 'ruby-encoding-map '(japanese-cp932 . cp932))

(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))

(add-hook 'ruby-mode-hook '(lambda () (require 'ruby-electric)
                             (ruby-electric-mode t)))
