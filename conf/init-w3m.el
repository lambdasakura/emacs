(add-to-load-path "~/.emacs.d/elisp/emacs-w3m/")
(require 'w3m-load)

(autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)
(autoload 'w3m-search "w3m-search" "Search QUERY using SEARCH-ENGINE." t)
(autoload 'w3m-weather "w3m-weather" "Display weather report." t)
(autoload 'w3m-antenna "w3m-antenna" "Report chenge of WEB sites." t)
(autoload 'w3m-namazu "w3m-namazu" "Search files with Namazu." t)
(autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)

(setq w3m-use-cookies t)

(setq w3m-favicon-cache-expire-wait nil)
(setq w3m-home-page "http://www.google.co.jp/")