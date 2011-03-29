;; simple hatena mode
(add-to-load-path "~/.emacs.d/elisp/simple-hatena-mode/")
(add-to-load-path "~/.emacs.d/elisp/hatena/")

(require 'simple-hatena-mode)
(setq simple-hatena-default-id "sakura-1")
(setq simple-hatena-bin "~/bin/hw.pl")
(setq simple-hatena-option-useragent "Hatena::Diary::Writer")

;; hatena mode
(setq load-path (cons (expand-file-name "~/.emacs.d/hatena/") load-path))
(load "hatena-mode")
(setq hatena-usrid "sakura-1")
(setq hatena-plugin-directory "~/.emacs.d/hatena/")
