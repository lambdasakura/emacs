;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ネットワークの設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun get-ip-address () 
  "Win32: get the IP-address of the first network interface"
  (let ((ipconfig (shell-command-to-string "ipconfig | findstr IPv4"))) 
    (string-match "\\(\\([0-9]+.\\)+[0-9]+\\)" ipconfig)
    (match-string 0 ipconfig)))

(defvar *network-interface-names* '("en1" "wlan0" "eth0" "rl0" "rl1")
  "Candidates for the network devices.")

(defun machine-ip-address (dev)
  "Return IP address of a network device."
  (let ((info (network-interface-info dev)))
    (if info
	(format-network-address (car info) t))))

(defun office-ip-p (ip)
  (let ((ip-list '("^133\\.196\\.*" "^133\\.119\\.*")))
    (member t (mapcar #'(lambda (x)
			  (eq 0 (string-match x ip))) ip-list))))

(defun networkp ()
  "ネットワークがつながっているかどうかを判定する"
  (let ((ip (if run-w32
		(get-ip-address)
	      (some #'machine-ip-address *network-interface-names*))))  ip ))

(defun officep ()
  "職場にいるかどうかを判定する"
  (let ((ip (if run-w32
		(get-ip-address)
	      (some #'machine-ip-address *network-interface-names*))))
    (when ip
      (car (office-ip-p ip)))))

(defun proxy-on ()
  "PROXY_SERVERを設定する。
NO_PROXYが正しく動作するのか未検証"
  (interactive)
  ;; (setenv "HTTP_PROXY" "http://proxy.rdc.toshiba.co.jp:8080/")
  (setenv "HTTP_PROXY" "http://proxy.toshiba.co.jp:8080/")
  (setenv "NO_PROXY" "localhost , 127.0.0.0/8,*.toshiba.co.jp,*.toshiba.local")
  (setq http-proxy-server "proxy.toshiba.co.jp"
	;; http-proxy-server "proxy.rdc.toshiba.co.jp"
	http-proxy-port "8080"
	url-proxy-services
	'(("no_proxy" . "localhost")
	  ("no_proxy" . "*.toshiba.local")
	  ("no_proxy" . "*.toshiba.co.jp")
	  ;; ("http" . "proxy.rdc.toshiba.co.jp:8080")
	  ;; ("http" . "proxy.rdc.toshiba.co.jp:8080")
	  ("http" . "proxy.toshiba.co.jp:8080")
	  ("https" . "proxy.toshiba.co.jp:8080"))))

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
(if (officep)
    (proxy-on)
  (proxy-off))
