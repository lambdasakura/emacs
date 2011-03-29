;;; psvn ‚Ìİ’è
;; Emacs‚©‚çSubversion‚ğg‚¤
(require 'psvn)
(add-hook 'svn-log-edit-mode-hook
          (function (lambda () 
                      (set-buffer-file-coding-system 'japanese-shift-jis-unix))))
(defadvice svn-status-create-arg-file (around bind-coding-system activate)
  (let ((coding-system-for-write 
     (or file-name-coding-system default-file-name-coding-system)))
    ad-do-it))
