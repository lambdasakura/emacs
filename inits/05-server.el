;; emacsclient

;;; Code:
(use-package server
  :config
  (when (and (>= emacs-major-version 23)
             (equal window-system 'w32))
    (defun server-ensure-safe-dir (dir) "Noop" t))
  (unless (server-running-p)
    (server-start))
  (remove-hook
   'kill-buffer-query-functions
   'server-kill-buffer-query-function))

(provide '05-server)
;;; 05-server.el ends here
