(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq markdown-css-path "~/.emacs.d/markdown.css")
(defun markdown-custom ()
  "markdown-mode-hook"
  (cond (run-darwin
         (setq markdown-command "multimarkdown"))
        (run-w32
         (setq markdown-command "perl ~/bin/Markdown.pl"))))
(add-hook 'markdown-mode-hook '(lambda()
                                 (setf markdown-indent-on-enter nil)
                                 (markdown-custom)))
