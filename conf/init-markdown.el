(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(defun markdown-custom ()
  "markdown-mode-hook"
(setq markdown-command "multimarkdown"))
(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))
