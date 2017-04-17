;;; 30-javascript.el --- web-mode settings
;;; Commentary:
;;; Code:

(defun kui/traverse-parents-for (filename &optional dirname)
  "Find FILENAME from parent directories of the current buffer file or DIRNAME"
  (if dirname
      (let ((path (concat (file-name-as-directory dirname) filename)))
        (if (file-exists-p path)
            path
          (if (string= "/" dirname)
              nil
            (kui/traverse-parents-for filename
                                      (file-name-directory
                                       (directory-file-name dirname))))))
    (kui/traverse-parents-for filename
                              (file-name-directory buffer-file-name))))
(defun kui/find-node-modules-bin (binname)
  "Find executable file named BINNAME from the node_modules directory"
  (let* ((moddir (kui/traverse-parents-for "node_modules"))
         (bin (if moddir (format "%s/.bin/%s" moddir binname))))
    (if (file-executable-p bin) bin)))

(defun kui/flycheck-set-node-modules-bin (checker binname)
  (let ((bin (kui/find-node-modules-bin binname)))
    (when bin
      (message "auto-detect %s: %s" binname bin)
      (flycheck-set-checker-executable checker bin))))

(defun kui/flycheck-set-checker-executable-from-node-modules ()
  (kui/flycheck-set-node-modules-bin 'javascript-jshint "jshint")
  (kui/flycheck-set-node-modules-bin 'javascript-eslint "eslint"))


(use-package web-mode
  :mode (("\\.jsx" . web-mode)
         ("\\.js" . web-mode))
  :init
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
  (add-hook 'web-mode-hook
            (lambda ()
              (when (equal web-mode-content-type "jsx")
                (kui/flycheck-set-checker-executable-from-node-modules)
                (flycheck-add-mode 'javascript-eslint 'web-mode)
                (flycheck-mode))
              ))
  (add-hook 'web-mode-hook
            (lambda ()
              (setq web-mode-attr-indent-offset nil)
              (setq web-mode-markup-indent-offset 2)
              (setq web-mode-css-indent-offset 2)
              (setq web-mode-code-indent-offset 2)
              (setq web-mode-sql-indent-offset 2)
              (setq indent-tabs-mode nil)
              (setq tab-width 2))))

(provide '30-javascript)
;;; 30-javascript.el ends here
