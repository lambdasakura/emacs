;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; howm �̐ݒ�
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq howm-menu-schedule-days 20)


;; howm�̐ݒ�
;; org-mode�������Ɏg����悤�ɐݒ肷��


(setq howm-file-name-format "%Y%m%d-%H%M%S.howm")

;; �f�� org �̎��� howm
(add-hook 'org-mode-hook 'howm-mode)

;; .org �� org + howm
(add-to-list 'auto-mode-alist '("\\.org" . org-mode))
;; .howm �� org + howm
(add-to-list 'auto-mode-alist '("\\.howm$" . org-mode))

(global-unset-key (kbd "C-x C-z"))
(setq howm-prefix (kbd "C-x C-z"))

;; title header �� "*"
(setq howm-view-title-header "*")


(require 'howm)

(eval-after-load "howm-mode"
  '(progn
     ;; \C-c \C-c �� org �ɓn��
     (define-key howm-mode-map (kbd "C-c C-c") nil)
     ;; ������������ elscreen �� kill -> �v elscreen-howm
     (define-key howm-mode-map (kbd "C-x C-z C-c")
       'howm-save-and-kill-buffer/screen)))
;; skk �ƕ��p���邽�߂̐ݒ�(Dired-X �� C-xC-j ��D���Ȃ��悤��)
(setq dired-bind-jump nil)

(setq howm-keyword-case-fold-search t)

;; ���t�����p�� regexp
(setq howm-reminder-regexp-grep-format
      (concat "<" howm-date-regexp-grep "[ :0-9]*>%s"))
(setq howm-reminder-regexp-format
      (concat "\\(<" howm-date-regexp "[ :0-9]*>\\)\\(\\(%s\\)\\([0-9]*\\)\\)"))


(set-face-foreground 'howm-mode-title-face "greenyellow")
(setq howm-directory "~/howm/")

;; ���܂蕶��?
;; (setq howm-menu-top nil)
(setq howm-menu-lang 'ja)
;; �ꗗ�Ƀ^�C�g����\�����Ȃ�
(setq howm-list-title nil)
;; save ���Ƀ��j���[���X�V���Ȃ�
(setq howm-menu-refresh-after-save nil)
(setq howm-refresh-after-save nil)
;; �V�K���������
(setq howm-prepend t)
;; �S�����ꗗ���Ƀ^�C�g���\��
(setq howm-list-all-title t)
;; �u�ŋ߂̃����v�ꗗ���Ƀ^�C�g���\��
(setq howm-list-recent-title t)
;; �u�ŋ߂̃����v�̕\������
(setq howm-menu-recent-num 30)
;;  ����(.) �͕\�����Ȃ�
(setq howm-todo-menu-types "[-+~!]")
;; ���j���[�� 2 ���ԃL���b�V��
(setq howm-menu-expiry-hours 2)
;; RET �Ńt�@�C�����J����, �ꗗ�o�b�t�@������. C-u RET �Ȃ�c��
(setq howm-view-summary-persistent nil)
;; 21 ���O����3 ����܂�
(setq howm-menu-schedule-days-before 10)


;; howm �̃e���v���[�g�̃J�X�^�}�C�Y
(setq howm-dtime-format (concat "<" howm-dtime-body-format ">"))
(setq howm-insert-date-format "<%s>")
(setq howm-template-date-format "<%Y-%m-%d %H:%M:%S>")
(setq howm-template-file-format "==>%s")
(setq howm-template "* %date %cursor\n\n")
(setq howm-reminder-today-format (format howm-insert-date-format howm-date-format))
;; Howm �� done ������ org �� done
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
