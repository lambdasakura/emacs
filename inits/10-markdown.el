(defun markdown-custom ()
  "markdown-mode-hook"
  )

(defun markdown-render-w3m (n)
  (interactive "p")
  (message (buffer-file-name))
  (call-process "/home/sakura/.local/bin/grip" nil nil nil
                "--export"
                (buffer-file-name)
                "/tmp/grip.html")
  (w3m-browse-url-other-window "file://tmp/grip.html"))


(use-package markdown-mode
  :mode (("\\.md" . markdown-mode))
  :config
  (setq markdown-css-paths '("~/.emacs.d/markdown.css"))

  (add-hook 'markdown-mode-hook
            '(lambda ()
               (define-key markdown-mode-map "\C-c\C-p" 'markdown-render-w3m)
               (setf markdown-indent-on-enter nil)
               (cond (run-linux
                      (setq markdown-command "markdown"))
                     (run-darwin
                      (setq markdown-command "multimarkdown"))
                     (run-w32
                      (setq markdown-command "perl ~/bin/Markdown.pl"))))))
