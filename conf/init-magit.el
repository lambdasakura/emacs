(require 'magit)
(if (eq system-type 'windows-nt)
    (setq magit-git-executable "C:/msysgit/msysgit/bin/git"))  

(define-key global-map (kbd "C-x g") 'magit-status)
