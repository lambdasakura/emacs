(add-to-list 'load-path "~/.emacs.d/elisp/scala/")
(when run-w32
  (setq scala-interpreter "C:/scala/bin/scala.bat") )
(require 'scala-mode-auto)