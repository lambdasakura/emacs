(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(defun markdown-custom ()
  "markdown-mode-hook"
  (cond (run-darwin
         (setq markdown-command "multimarkdown"))
        (run-w32
         (setq markdown-command "perl ~/bin/Markdown.pl"))))
(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))
