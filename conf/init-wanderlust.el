;; wl
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

;; IMAP サーバの設定
(setq elmo-imap4-default-server "imap.gmail.com")
(setq elmo-imap4-default-user "sakuranbo0216@gmail.com") ; 適宜修正してください
(setq elmo-imap4-default-authenticate-type 'clear) ; 以下3行コメント欄での指摘により追記
(setq elmo-imap4-default-port '993)
(setq elmo-imap4-default-stream-type 'ssl)

(setq elmo-imap4-use-modified-utf7 t) ; 日本語フォルダ対策

;; SMTP サーバの設定
(setq wl-smtp-connection-type 'starttls)
(setq wl-smtp-posting-port 587)
(setq wl-smtp-authenticate-type "plain")
(setq wl-smtp-posting-user "sakuranbo0216@gmail.com") ; 適宜修正してください
(setq wl-smtp-posting-server "smtp.gmail.com")
(setq wl-local-domain "gmail.com")

;; デフォルトのフォルダ
(setq wl-default-folder "%inbox")

;; フォルダ名補完時に使用するデフォルトのスペック
(setq wl-default-spec "%")
(setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAPの仕様に合わせて
(setq wl-trash-folder "%[Gmail]/Trash")

(setq wl-folder-check-async t) ; 非同期でチェックするように
;;(defvar wl-dispose-folder-alist nil)
;;(setq wl-dispose-folder-alist
;;      (cons '("^%inbox" . remove) wl-dispose-folder-alist))

