(setq twittering-use-master-password t)
(when run-w32
  (setq twittering-curl-program "~/twittering-mode/win-curl/curl.exe")
  (setq twittering-cert-file "~/twittering-mode/win-curl/curl-ca-bundle.crt")
  (setq twittering-allow-insecure-server-cert t))
