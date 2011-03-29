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
;;(setq scheme-program-name "C:/MzScheme/MzScheme.exe") ; run-scheme �œ����������n
;;(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
;;(define-key global-map "\C-cs" 'run-scheme) ; C-c s �� emacs ��� MzScheme ������悤�ɂ���
;;;; Emacs �� scheme ��p�Ɏg�����ɂ͈ȉ���ǉ�����ƕ֗�
;;(setq inhibit-startup-message t)  ; �N����ʂ�\�����Ȃ�
;;;(run-scheme scheme-program-name)  ; �N�����ɂ����Ȃ� scheme �����n�𑖂点��
