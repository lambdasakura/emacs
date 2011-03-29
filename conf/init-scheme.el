;;----------------------------------
;; scheme 
;;----------------------------------
(setq scheme-program-name "gosh -i")
(autoload 'scheme-mode "cmuscheme" "Majaor mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

(define-key global-map
  "\C-cs" 'scheme-other-window)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; for scheme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;(setq scheme-program-name "C:/MzScheme/MzScheme.exe") ; run-scheme で動かす処理系
;;(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
;;(define-key global-map "\C-cs" 'run-scheme) ; C-c s で emacs 上で MzScheme が走るようにする
;;;; Emacs を scheme 専用に使う時には以下を追加すると便利
;;(setq inhibit-startup-message t)  ; 起動画面を表示しない
;;;(run-scheme scheme-program-name)  ; 起動時にいきなり scheme 処理系を走らせる
