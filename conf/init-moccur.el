;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color-moccur
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; http://www.emacswiki.org/emacs/moccur-edit.el
(require 'moccur-edit)

;; 複数の検索語や、特定のフェイスのみマッチ等の機能を有効にする
(setq moccur-split-word t)

;; migemoがrequireできる環境ならmigemoを使う
(when (require 'migemo nil t)
  (setq moccur-use-migemo t))


