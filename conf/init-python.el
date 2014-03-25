;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'python)

;; (semantic-mode 1) 
(add-hook 'python-mode-hook
  (lambda ()
    (setq imenu-create-index-function 'python-imenu-create-index)))

(if run-darwin
    (quickrun-add-command 
     "python"
     '((:command . "/Users/sakura/.pyenv/shims/python"))))

;; (require 'elpy)
;; (elpy-enable)
