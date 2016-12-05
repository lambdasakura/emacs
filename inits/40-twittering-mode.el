(use-package twittering-mode
  :config
  (setq twittering-use-master-password t)
  (when run-w32
    (setq twittering-curl-program "C:/Users/sakura/Application/curl/curl.exe")
    (setq twittering-cert-file "C:/Users/sakura/Application/curl/ca-bundle.crt")
    (setq twittering-allow-insecure-server-cert t)))
