(add-to-load-path "~/.emacs.d/elisp/magit-1.2.0")
(require 'magit)
(if (eq system-type 'windows-nt)
    (setq magit-git-executable "C:/msysgit/msysgit/bin/git"))  

(define-key global-map (kbd "C-x g") 'magit-status)
