;; emacs-w3m�̍ݏ�
;; (add-to-load-path "/Users/sakura/.emacs.d/w3m/share/emacs/site-lisp/w3m/")

;; (when run-w32
;;   ;; cygwin��w3m���g�����߂̐ݒ�
;;   (dolist (dir (list "C:\\Cygwin64\\bin" ))

;;     ;; PATH �� exec-path �ɓ�������ǉ����܂�
;;     (when (and (file-exists-p dir) (not (member dir exec-path)))
;;       (setenv "PATH" (concat dir ":" (getenv "PATH")))
;;       (setq exec-path (append (list dir) exec-path))))

;;   (setq w3m-command "C:\\Cygwin64\\bin\\w3m"))
;; (require 'w3m-load)

;; (autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)
;; (autoload 'w3m-search "w3m-search" "Search QUERY using SEARCH-ENGINE." t)
;; (autoload 'w3m-weather "w3m-weather" "Display weather report." t)
;; (autoload 'w3m-antenna "w3m-antenna" "Report chenge of WEB sites." t)
;; (autoload 'w3m-namazu "w3m-namazu" "Search files with Namazu." t)
;; (autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)

;; (setq w3m-home-page "http://www.google.co.jp/")

(setq w3m-use-cookies t)
(setq w3m-cookie-accept-bad-cookies t)
(defun w3m-browse-url-other-window (url &optional newwin)
  (let ((w3m-pop-up-windows t))
    (if (one-window-p) (split-window))
    (other-window 1)
    (w3m-browse-url url newwin)))


;; (setq w3m-favicon-cache-expire-wait nil)
;; (setq transient-mark-mode t)
;; (setq w3m-display-inline-image t)
