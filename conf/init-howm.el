;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; howm の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq howm-menu-schedule-days 20)


;; howmの設定
;; org-modeも同時に使えるように設定する


(setq howm-file-name-format "%Y%m%d-%H%M%S.howm")

;; 素の org の時も howm
(add-hook 'org-mode-hook 'howm-mode)

;; .org は org + howm
(add-to-list 'auto-mode-alist '("\\.org" . org-mode))
;; .howm も org + howm
(add-to-list 'auto-mode-alist '("\\.howm$" . org-mode))

(global-unset-key (kbd "C-x C-z"))
(setq howm-prefix (kbd "C-x C-z"))

;; title header は "*"
(setq howm-view-title-header "*")


(require 'howm)

(eval-after-load "howm-mode"
  '(progn
     ;; \C-c \C-c は org に渡す
     (define-key howm-mode-map (kbd "C-c C-c") nil)
     ;; メモ書いたら elscreen を kill -> 要 elscreen-howm
     (define-key howm-mode-map (kbd "C-x C-z C-c")
       'howm-save-and-kill-buffer/screen)))
;; skk と併用するための設定(Dired-X に C-xC-j を奪われないように)
(setq dired-bind-jump nil)

(setq howm-keyword-case-fold-search t)

;; 日付検索用の regexp
(setq howm-reminder-regexp-grep-format
      (concat "<" howm-date-regexp-grep "[ :0-9]*>%s"))
(setq howm-reminder-regexp-format
      (concat "\\(<" howm-date-regexp "[ :0-9]*>\\)\\(\\(%s\\)\\([0-9]*\\)\\)"))


(set-face-foreground 'howm-mode-title-face "greenyellow")
(setq howm-directory "~/howm/")

;; 決まり文句?
;; (setq howm-menu-top nil)
(setq howm-menu-lang 'ja)
;; 一覧にタイトルを表示しない
(setq howm-list-title nil)
;; save 時にメニューを更新しない
(setq howm-menu-refresh-after-save nil)
(setq howm-refresh-after-save nil)
;; 新規メモを上に
(setq howm-prepend t)
;; 全メモ一覧時にタイトル表示
(setq howm-list-all-title t)
;; 「最近のメモ」一覧時にタイトル表示
(setq howm-list-recent-title t)
;; 「最近のメモ」の表示件数
(setq howm-menu-recent-num 30)
;;  完了(.) は表示しない
(setq howm-todo-menu-types "[-+~!]")
;; メニューを 2 時間キャッシュ
(setq howm-menu-expiry-hours 2)
;; RET でファイルを開く際, 一覧バッファを消す. C-u RET なら残る
(setq howm-view-summary-persistent nil)
;; 21 日前から3 日後まで
(setq howm-menu-schedule-days-before 10)


;; howm のテンプレートのカスタマイズ
(setq howm-dtime-format (concat "<" howm-dtime-body-format ">"))
(setq howm-insert-date-format "<%s>")
(setq howm-template-date-format "<%Y-%m-%d %H:%M:%S>")
(setq howm-template-file-format "==>%s")
(setq howm-template "* %date %cursor\n\n")
(setq howm-reminder-today-format (format howm-insert-date-format howm-date-format))
;; Howm で done したら org も done
(defadvice howm-action-lock-done-done
  (after my-org-todo-done () activate) (org-todo))

 (defadvice howm-exclude-p (around howm-suffix-only (filename) activate)
   ad-do-it
   (setq ad-return-value
  (or ad-return-value
      ;; include directories and *.howm
      (not (or (file-directory-p filename)
               (string-match "[.]howm$" filename))))))

(setq howm-excluded-file-regexp "\\(^\|/\\)\\([.]\|CVS/\\)\|[~#]$\|\\.\\(css\|html\|txt\|bak\|elc\|gz\|aux\|toc\|idx\|dvi\|jpg\|gif\|png\\)$")
