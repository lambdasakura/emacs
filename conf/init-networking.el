;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ネットワークの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar *network-interface-names* '("en1" "wlan0" "eth0" "rl0" "rl1")
  "Candidates for the network devices.")


(defun machine-ip-address (dev)
  "Return IP address of a network device."
  (let ((info (network-interface-info dev)))
    (if info
	(format-network-address (car info) t))))

(defun networkp ()
  "ネットワークがつながっているかどうかを判定する"
  (let ((ip (some #'machine-ip-address *network-interface-names*)))  ip ))

(defun officep ()
  "職場にいるかどうかを判定する"
  (let ((ip (some #'machine-ip-address *network-interface-names*)))
    (and ip
	 (eq 0 (string-match "^133\\.196\\.*" ip)))))

(defun proxy-on ()
  "PROXY_SERVERを設定する。
NO_PROXYが正しく動作するのか未検証"
  (interactive)
  (setenv "HTTP_PROXY" "http://proxy.rdc.toshiba.co.jp:8080/")
  (setenv "NO_PROXY" "localhost , 127.0.0.0/8,*.toshiba.co.jp,*.toshiba.local")
  (setq http-proxy-server "proxy.rdc.toshiba.co.jp"
	http-proxy-port "8080"
	url-proxy-services
	'(("no_proxy" . "localhost")
	  ("no_proxy" . "*.toshiba.local")
	  ("no_proxy" . "*.toshiba.co.jp")
	  ("http" . "proxy.rdc.toshiba.co.jp:8080")
	  ("https" . "proxy.rdc.toshiba.co.jp:8080"))))

(defun proxy-off ()
  "PROXY_SERVERを解除する。"
  (interactive)
  (setenv "HTTP_PROXY" "")
  (setenv "NO_PROXY" "")
  (setq http-proxy-server nil
	http-proxy-port nil
	url-proxy-services nil	))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ネットワークの場所別の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (if (officep)
;;     (proxy-on)
;;   (proxy-off))
(proxy-on)

;;  なぜかうまく動いてくれなかった
(if (networkp)
    (auto-install-update-emacswiki-package-name t))
