(require 'package)
(require 'cl)

;; in emacs-version@24.4
;; 'package-desc-vers' was renamed to 'package--ac-desc-version'
(if (and (>= emacs-major-version 24 )
         (>= emacs-minor-version 4))
    (fset 'package-desc-vers 'package--ac-desc-version))

;; Add package-archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)



(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    flymake
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
    nav
    yatex
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
    ;; haml-mode
    slim-mode
    coffee-mode
    scss-mode
    js2-mode
    js3-mode
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
    slime
;;    slime-annot
    ac-slime
    evil
    popwin
    ))

(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
