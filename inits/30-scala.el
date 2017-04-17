;; scala-mode2
(require 'scala-mode)

;; ensime
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(add-to-list 'auto-mode-alist '("\\.sbt$" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
