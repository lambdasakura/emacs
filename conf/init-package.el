;;; init-package.el --- emacs package settings
;;; Commentary:

;;; Code:
(require 'package)

;; Add package-archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(defvar installing-package-list
  '(cl-lib
    slack
    use-package
    bind-key
    init-loader
    exec-path-from-shell
    auto-complete
    atom-one-dark-theme
    powerline
    projectile
    ag
    wgrep
    wgrep-ag
    helm
    helm-ag
    helm-descbinds
    helm-gtags
    helm-c-yasnippet
    helm-projectile
    quickrun
    yatex
    yasnippet
    wgrep
    w3m
    neotree
    magit
    ;; プログラミング関連
    markdown-mode
    inf-ruby
    php-mode
    sass-mode
    web-mode
    js2-mode
    haskell-mode
    google-c-style
    yaml-mode
    scala-mode
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
    evil
    evil-magit
    popwin
    go-mode
    go-autocomplete
    go-eldoc
    flycheck
    flycheck-pos-tip
    ))

(require 'cl)
(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
