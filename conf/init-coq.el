;; load proof-generic
(load-file "~/.emacs.d/ProofGeneral/ProofGeneral-4.2/generic/proof-site.el")

(defadvice coq-mode-config (after deactivate-holes-mode () activate)
  "Deactivate holes-mode when coq-mode is activated."
  (progn  (show-paren-mode -1)(holes-mode 0)))

(add-hook 'proof-mode-hook
          '(lambda ()
             (define-key proof-mode-map (kbd "C-c C-j") 'proof-goto-point)))
