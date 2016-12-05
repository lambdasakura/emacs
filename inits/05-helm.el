(require 'helm-config)
(require 'helm-command)
(require 'helm-descbinds)
(require 'helm-files)
(require 'all-ext)

(helm-mode 1)
(helm-adaptive-mode 1)
(helm-push-mark-mode 1)
(setq helm-ff-auto-update-initial-value 1
      helm-idle-delay             0.1
      helm-input-idle-delay       0.1
      helm-candidate-number-limit 200)

(bind-keys ("C-r" . helm-for-files)
           ("C-^" . helm-c-apropos)
           ("C-^" . helm-c-apropos)
           ("C-l" . helm-bookmarks)
           ("C-;" . helm-resume)
           ("M-s" . helm-occur)
           ("M-x" . helm-M-x)
           ("M-y" . helm-show-kill-ring)
           ("M-z" . helm-do-grep)
           ("C-S-;" .  helm-descbinds)
           ("C-x C-f" . helm-find-files)
           ("C-M-o" . helm-occur)
           ("C-x C-r" . helm-recentf)
           ("C-x C-f" . helm-find-files)
           ("C-x rl" . helm-bookmarks)
           ("C-M-o" . helm-occur))

;; isearchからhelm-occurを起動
;; helm-occurからall-extに受け渡し
(bind-key "C-o" 'helm-occur-from-isearch isearch-mode-map)
(bind-key "C-c C-a" 'all-from-helm-occur helm-map)

;; 自動補完を無効
(custom-set-variables '(helm-ff-auto-update-initial-value nil))

;; For find-file etc.
(bind-keys :map helm-find-files-map
           ("C-h" . delete-backward-char)
           ("TAB" . helm-execute-persistent-action))
