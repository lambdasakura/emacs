(require 'helm-config)
(require 'helm-command)
(require 'helm-descbinds)
(require 'helm-files)
(require 'all-ext)

(helm-mode 1)
(helm-adaptive-mode 1)
(helm-push-mark-mode 1)

(setq helm-idle-delay             0.1
      helm-input-idle-delay       0.1
      helm-candidate-number-limit 200)
(let ((key-and-func
       `((,(kbd "C-r")   helm-for-files)
         (,(kbd "C-^")   helm-c-apropos)
         (,(kbd "C-l")   helm-bookmarks)
         (,(kbd "C-;")   helm-resume)
         (,(kbd "M-s")   helm-occur)
         (,(kbd "M-x")   helm-M-x)
         (,(kbd "M-y")   helm-show-kill-ring)
         (,(kbd "M-z")   helm-do-grep)
         (,(kbd "C-S-;") helm-descbinds)
         )))
  (loop for (key func) in key-and-func
        do (global-set-key key func)))

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-M-o") 'helm-occur) ;; helm-occurの起動
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x rl") 'helm-bookmarks)
(global-set-key (kbd "C-M-o") 'helm-occur)

;; isearchからhelm-occurを起動
(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch)
;; helm-occurからall-extに受け渡し
(define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur)

;; 自動補完を無効
(custom-set-variables '(helm-ff-auto-update-initial-value nil))

;; For find-file etc.
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;; For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key isearch-mode-map (kbd "C-o") 'helm-occur-from-isearch) ;; isearchからhelm-occurを起動
(define-key helm-map (kbd "C-c C-a") 'all-from-helm-occur) ;; helm-occurからall-extに受け渡し

;; 自動補完を無効
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
;; C-hでバックスペースと同じように文字を削除
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
;; TABで任意補完。選択肢が出てきたらC-nやC-pで上下移動してから決定することも可能
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)


;; For find-file etc.
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(setf helm-ff-auto-update-initial-value 1)
