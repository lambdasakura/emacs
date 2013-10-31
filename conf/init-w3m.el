;; emacs-w3mの在処
(add-to-load-path "/Users/sakura/.emacs.d/w3m/share/emacs/site-lisp/w3m/")

(when run-w32
  ;; cygwinのw3mを使うための設定
  (dolist (dir (list "C:\\Cygwin\\bin" ))

    ;; PATH と exec-path に同じ物を追加します
    (when (and (file-exists-p dir) (not (member dir exec-path)))
      (setenv "PATH" (concat dir ":" (getenv "PATH")))
      (setq exec-path (append (list dir) exec-path))))
  
  (setq w3m-command "C:\\Cygwin\\bin\\w3m"))

;; (require 'w3m-load)

(autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)
(autoload 'w3m-search "w3m-search" "Search QUERY using SEARCH-ENGINE." t)
(autoload 'w3m-weather "w3m-weather" "Display weather report." t)
(autoload 'w3m-antenna "w3m-antenna" "Report chenge of WEB sites." t)
(autoload 'w3m-namazu "w3m-namazu" "Search files with Namazu." t)
(autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)

(setq w3m-use-cookies t)

(setq w3m-favicon-cache-expire-wait nil)
(setq w3m-home-page "http://www.google.co.jp/")
(setq transient-mark-mode t)

(eval-after-load "w3m-search"
  '(progn
     (add-to-list 'w3m-search-engine-alist
                '("alc"
                  "http://eow.alc.co.jp/%s/UTF-8/"
                  utf-8))
     (add-to-list 'w3m-uri-replace-alist
                  '("\`alc:" w3m-search-uri-replace "alc"))))

(require 'w3m-search)

(defun w3m-search-alc (url)
  "alc検索コマンド"
  (interactive (list (read-from-minibuffer "alc: ")))
  (w3m-goto-url (concat "alc:" url)))

(define-key w3m-mode-map "U" 'w3m-search-alc)
