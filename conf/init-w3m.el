;;------------------------------------------
;; w3mの設定
;;------------------------------------------
(when run-darwin
  (add-to-list 'load-path "/opt/local/share/emacs/site-lisp/w3m")
  (require 'w3m-load))

;;(add-to-list 'load-path "~/.emacs.d/elisp/emacs-w3m/")
;;(require 'w3m)

(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;(setq w3m-command "/opt/local/bin/w3m")
(setq w3m-command "/opt/local/bin/w3m")

(setq browse-url-browser-function 'w3m-browse-url) ; Emacs-w3m を browse-url のデフォルト・ブラウザにする
(setq browse-url-new-window-flag t) ; 新規タブで browse-url する
(setq w3m-fill-column 150)

(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)
(autoload 'w3m-search "w3m-search" "Search QUERY using SEARCH-ENGINE." t)
(autoload 'w3m-weather "w3m-weather" "Display weather report." t)
(autoload 'w3m-antenna "w3m-antenna" "Report chenge of WEB sites." t)
(autoload 'w3m-namazu "w3m-namazu" "Search files with Namazu." t)

(setq w3m-icon-directory
      (cond
       ((featurep 'mac-carbon) "/Applications/Emacs.app/Contents/Resource/etc/w3m")
       ((featurep 'dos-w32) "D:/cygwin//usr/local/emacs/etc/w3m")))
(setq w3m-namazu-tmp-file-name
      (cond
       ((featurep 'mac-carbon) "~/.nmz.html")
       ((featurep 'dos-w32) "d:/cygwin/home/hoge/.nmz.html")))
(setq w3m-namazu-index-file "~/.w3m-namazu.index")
(setq w3m-bookmark-file
      (cond
       ((featurep 'mac-carbon) "~/.w3m/bookmark.html")
       ((featurep 'dos-w32) "d:/cygwin/home/hoge/public_html/bookmark.html")))
(if (featurep 'dos-w32)
    (setq w3m-imagick-convert-program "d:/cygwin/usr/local/bin/convert.exe"))

