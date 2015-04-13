;; markdown
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; C++ languate
(add-to-list 'auto-mode-alist '("\\.C$"   . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cc$"  . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c$"   . c-mode))
(add-to-list 'auto-mode-alist '("\\.h$"   . c++-mode))

;; haskell
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))

;; .howm, org は org + howm
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.howm$" . org-mode))

;; javascript
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

;; ruby
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))

;; scala
(add-to-list 'auto-mode-alist '("\\.sbt$" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))

;; emacs lisp用のlisp-modeはemacs-lisp-modeを使用する設定に
(add-to-list 'auto-mode-alist '("\\.el$" .emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs-*" .emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.wl$" .emacs-lisp-mode))

(add-to-list 'auto-mode-alist '("\\.tex$" 'yatex-mode))
