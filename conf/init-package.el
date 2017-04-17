(require 'package)
(require 'cl)

;; Add package-archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defvar installing-package-list
  '(
    use-package
    bind-key
    init-loader
    dired+
    markdown-mode
    auto-complete
    cl-lib
    helm
    helm-descbinds
    helm-gtags
    helm-c-moccur
    helm-c-yasnippet
    powerline
    quickrun
    yatex
    yasnippet
    deferred
    color-moccur
    w3m
    all-ext
    neotree
    ;; プログラミング関連
    inf-ruby
    php-mode
    sass-mode
    web-mode
    js2-mode
    haskell-mode
    google-c-style
    yaml-mode
    scala-mode2
    ensime
    python
    jedi
    ruby-block
    ruby-electric
    ruby-mode
    clojure-mode
    cider
    ac-cider
    twittering-mode
    cl-lib
    ac-slime
    evil
    popwin
    go-mode
    go-autocomplete
    go-eldoc
    flycheck
    flycheck-pos-tip
    exec-path-from-shell))

(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
