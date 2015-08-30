(when run-w32
  ;; cygwinのw3mを使うための設定
  (dolist (dir (list "C:\\msys64\\usr\\bin\\" ))
    ;; PATH と exec-path に同じ物を追加します
    (when (and (file-exists-p dir) (not (member dir exec-path)))
      (setenv "PATH" (concat dir ":" (getenv "PATH")))
      (setq exec-path (append (list dir) exec-path)))))

(setq twittering-use-master-password t)
(when run-w32
  (setq twittering-curl-program "C:/Users/sakura/Application/curl/curl.exe")
  (setq twittering-cert-file "C:/Users/sakura/Application/curl/ca-bundle.crt")
  (setq twittering-allow-insecure-server-cert t))
