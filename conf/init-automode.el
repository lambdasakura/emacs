;; .howm, org �� org + howm
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.howm$" . org-mode))

;; emacs lisp�Ѥ�lisp-mode��emacs-lisp-mode����Ѥ��������
(add-to-list 'auto-mode-alist '("\\.el$" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.emacs-*" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.wl$" . emacs-lisp-mode))
