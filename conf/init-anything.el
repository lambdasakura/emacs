;; 簡単設定の方

;;(require 'anything-startup)
;; (auto-install-batch "anything-minimal")
;; (require 'anything-config)
;; (require 'anything-complete)
(require 'anything-config)
(require 'anything-complete)
(define-key global-map (kbd "C-x b") 'anything-for-files)
(define-key global-map (kbd "C-x f") 'anything-find-file)
(define-key global-map (kbd "C-x C-f") 'anything-find-file)
(define-key global-map (kbd "M-y")   'anything-show-kill-ring)
(define-key global-map (kbd "M-x")
  (lambda ()
    (interactive)
    (anything-other-buffer
     '(anything-c-source-extended-command-history
       anything-c-source-emacs-commands)
     "*anything emacs commands*")))
