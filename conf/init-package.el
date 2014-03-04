(require 'package)

;; Add package-archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

; Initialize
(package-initialize)

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
    slime
    slime-annot
    ac-slime

    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

; melpa.el
(require 'melpa)
