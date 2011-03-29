(add-to-load-path "~/.emacs.d/elisp/migemo-0.40")
(load "migemo.el")

(setq migemo-directory "C:/MinGW/share/migemo")


;; キャッシュ機能
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)
(setq migemo-pattern-alist-length 1024)
(setq migemo-coding-system 'japanese-shift-jis-unix)
(load-library "migemo")

;; 起動時に初期化
(migemo-init)