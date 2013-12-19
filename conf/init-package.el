(require 'package)

;; Add package-archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

; Initialize
(package-initialize)
; melpa.el
(require 'melpa)

(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    markdown-mode
    open-junk-file
    auto-complete
    cl-lib
    elscreen
    magit
    helm
    helm-descbinds
    helm-gtags
    quickrun
    melpa
    nav
    yasnippet
    deferred
    color-moccur
    w3m
    all-ext
    haskell-mode
    ;; プログラミング関連
    inf-ruby
    php-mode
    sass-mode
    web-mode
    haml-mode
    slim-mode
    coffee-mode
    scss-mode
    js2-mode
    js3-mode
    haskell-mode
    google-c-style
    yaml-mode
    scala-mode    
    python
    jedi
    ruby-block
    ruby-electric
    ruby-mode
    twittering-mode
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

(require 'twittering-mode)
(setq twittering-proxy-use t)
(setq twittering-proxy-server "proxy.rdc.toshiba.co.jp")
(setq twittering-proxy-port 8080)
(setq twittering-icon-mode t)
(setq twittering-use-master-password t)
(setq twittering-convert-fix-size 48)
;; 起動時に以下のリストを読みこむ
(setq twittering-initial-timeline-spec-string 
      '("lambda_sakura/doujin-soft" 
	"lapis_moon/byouin" 
	":direct_messages"
	":mentions"
	":home"))
