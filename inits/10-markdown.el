(defun markdown-custom ()
  "markdown-mode-hook"
  )

(use-package markdown-mode
  :mode (("\\.md" . markdown-mode))
  :config
  (setq markdown-css-path "~/.emacs.d/markdown.css")
  (add-hook 'markdown-mode-hook
            '(lambda ()
               (setf markdown-indent-on-enter nil)
               (cond (run-darwin
                      (setq markdown-command "multimarkdown"))
                     (run-w32
                      (setq markdown-command "perl ~/bin/Markdown.pl"))))))
