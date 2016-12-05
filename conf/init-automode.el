;; .howm, org は org + howm
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.howm$" . org-mode))

;; emacs lisp用のlisp-modeはemacs-lisp-modeを使用する設定に
(add-to-list 'auto-mode-alist '("\\.el$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs-*" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.wl$" . emacs-lisp-mode))
