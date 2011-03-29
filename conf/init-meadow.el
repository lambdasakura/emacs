;;; IME�̐ݒ�
(mw32-ime-initialize)
(setq default-input-method "MW32-IME")
(setq-default mw32-ime-mode-line-state-indicator "[--]")
(setq mw32-ime-mode-line-state-indicator-list '("[--]" "[��]" "[--]"))
(add-hook 'mw32-ime-on-hook
	  (function (lambda () (set-cursor-height 2))))
(add-hook 'mw32-ime-off-hook
	  (function (lambda () (set-cursor-height 4))))

;;; �}�E�X�J�[�\���������ݒ�
(setq w32-hide-mouse-on-key t)
(setq w32-hide-mouse-timeout 5000)


;;; font-lock�̐ݒ�
(global-font-lock-mode t)

;;; TrueType �t�H���g�ݒ�
(w32-add-font
 "private-fontset"
 '((spec
    ((:char-spec ascii :height 120)
     strict
     (w32-logfont "Courier New" 0 -13 400 0 nil nil nil 0 1 3 49))
    ((:char-spec ascii :height 120 :weight bold)
     strict
     (w32-logfont "Courier New" 0 -13 700 0 nil nil nil 0 1 3 49))
    ((:char-spec ascii :height 120 :slant italic)
     strict
     (w32-logfont "Courier New" 0 -13 400 0   t nil nil 0 1 3 49))
    ((:char-spec ascii :height 120 :weight bold :slant italic)
     strict
     (w32-logfont "Courier New" 0 -13 700 0   t nil nil 0 1 3 49))
    ((:char-spec japanese-jisx0208 :height 120)
     strict
     (w32-logfont "�l�r �S�V�b�N" 0 -16 400 0 nil nil nil 128 1 3 49))
    ((:char-spec japanese-jisx0208 :height 120 :weight bold)
     strict
     (w32-logfont "�l�r �S�V�b�N" 0 -16 700 0 nil nil nil 128 1 3 49)
     ((spacing . -1)))
    ((:char-spec japanese-jisx0208 :height 120 :slant italic)
     strict
     (w32-logfont "�l�r �S�V�b�N" 0 -16 400 0   t nil nil 128 1 3 49))
    ((:char-spec japanese-jisx0208 :height 120 :weight bold :slant italic)
     strict
     (w32-logfont "�l�r �S�V�b�N" 0 -16 700 0   t nil nil 128 1 3 49)
     ((spacing . -1))))))

(set-face-attribute 'variable-pitch nil :family "*")

(w32-add-font
 "Meiryo"
 '((strict-spec
	((:char-spec ascii :height any)
	 (w32-logfont "���C���I" 0 20 400 0 nil nil nil 0 1 3 49))
	((:char-spec ascii :height any :weight bold)
	 (w32-logfont "���C���I" 0 20 700 0 nil nil nil 0 1 3 49))
	((:char-spec ascii :height any :slant italic)
	 (w32-logfont "���C���I" 0 20 400 0	t nil nil 0 1 3 49))
	((:char-spec ascii :height any :weight bold :slant italic)
	 (w32-logfont "���C���I" 0 20 700 0	t nil nil 0 1 3 49))
	((:char-spec japanese-jisx0208 :height any)
	 (w32-logfont "���C���I" 0 20 400 0 nil nil nil 128 1 3 49))
	((:char-spec japanese-jisx0208 :height any :weight bold)
	 (w32-logfont "���C���I" 0 20 700 0 nil nil nil 128 1 3 49)
	 ((spacing . -1)))
	((:char-spec japanese-jisx0208 :height any :slant italic)
	 (w32-logfont "���C���I" 0 20 400 0	t nil nil 128 1 3 49))
	((:char-spec japanese-jisx0208 :height any :weight bold :slant italic)
	 (w32-logfont "���C���I" 0 20 700 0	t nil nil 128 1 3 49)
	 ((spacing . -1)))
	((:char-spec katakana-jisx0201 :height any)
	 (w32-logfont "���C���I" 0 20 400 0 nil nil nil 128 1 3 49))
	((:char-spec katakana-jisx0201 :height any :weight bold)
	 (w32-logfont "���C���I" 0 20 700 0 nil nil nil 128 1 3 49)
	 ((spacing . -1)))
	((:char-spec katakana-jisx0201 :height any :slant italic)
	 (w32-logfont "���C���I" 0 20 400 0	t nil nil 128 1 3 49))
	((:char-spec katakana-jisx0201 :height any :weight bold :slant italic)
	 (w32-logfont "���C���I" 0 20 700 0	t nil nil 128 1 3 49)
	 ((spacing . -1)))
)))

(w32-add-font
 "Meiryo-40"
 '((strict-spec
	((:char-spec ascii :height any)
	 (w32-logfont "���C���I" 0 40 400 0 nil nil nil 0 1 3 49))
	((:char-spec ascii :height any :weight bold)
	 (w32-logfont "���C���I" 0 40 700 0 nil nil nil 0 1 3 49))
	((:char-spec ascii :height any :slant italic)
	 (w32-logfont "���C���I" 0 40 400 0	t nil nil 0 1 3 49))
	((:char-spec ascii :height any :weight bold :slant italic)
	 (w32-logfont "���C���I" 0 40 700 0	t nil nil 0 1 3 49))
	((:char-spec japanese-jisx0208 :height any)
	 (w32-logfont "���C���I" 0 40 400 0 nil nil nil 128 1 3 49))
	((:char-spec japanese-jisx0208 :height any :weight bold)
	 (w32-logfont "���C���I" 0 40 700 0 nil nil nil 128 1 3 49)
	 ((spacing . -1)))
	((:char-spec japanese-jisx0208 :height any :slant italic)
	 (w32-logfont "���C���I" 0 40 400 0	t nil nil 128 1 3 49))
	((:char-spec japanese-jisx0208 :height any :weight bold :slant italic)
	 (w32-logfont "���C���I" 0 40 700 0	t nil nil 128 1 3 49)
	 ((spacing . -1)))
	((:char-spec katakana-jisx0201 :height any)
	 (w32-logfont "���C���I" 0 40 400 0 nil nil nil 128 1 3 49))
	((:char-spec katakana-jisx0201 :height any :weight bold)
	 (w32-logfont "���C���I" 0 40 700 0 nil nil nil 128 1 3 49)
	 ((spacing . -1)))
	((:char-spec katakana-jisx0201 :height any :slant italic)
	 (w32-logfont "���C���I" 0 40 400 0	t nil nil 128 1 3 49))
	((:char-spec katakana-jisx0201 :height any :weight bold :slant italic)
	 (w32-logfont "���C���I" 0 40 700 0	t nil nil 128 1 3 49)
	 ((spacing . -1)))
	)))

;(modify-frame-parameters nil '((scroll-bar-width . 8)))

;; �����t���[���̐ݒ�
;; (setq default-frame-alist
;;       (append (list '(foreground-color . "black")
;; 		    '(background-color . "white")
;; ;;		    '(background-color . "LemonChiffon")
;; 		    '(background-color . "gray")
;; 		    '(border-color . "black")
;; 		    '(mouse-color . "white")
;; 		    '(cursor-color . "black")
;; ;;		    '(ime-font . (w32-logfont "�l�r �S�V�b�N"
;; ;;					      0 16 400 0 nil nil nil
;; ;;					      128 1 3 49)) ; TrueType �̂�
;; ;;		    '(font . "bdf-fontset")    ; BDF
;; 		    '(font . "Meiryo"); TrueType
;; 		    '(width . 70)
;; 		    '(height . 30)
;; 		    '(top . 0)
;; 		    '(left . 0))
;; 	      default-frame-alist))


;; ;;; shell �̐ݒ�
;;; Cygwin �� bash ���g���ꍇ
;; (setq explicit-shell-file-name "c:/cygwin/bin/bash")
;; (setq shell-file-name "sh")
;; (setq shell-command-switch "-c") 

;; (add-hook 'shell-mode-hook
;;       (lambda ()
;;         (set-buffer-process-coding-system 'sjis-dos 'sjis-unix)))
;; (setenv "PATH" (format "c:\\cygwin\\bin;%s" (getenv "PATH")))
;; (setq cygwin-mount-cygwin-bin-directory "c:/cygwin/bin")
;;(require 'cygwin-mount-mw32)
;;(cygwin-mount-activate)

;; ;;; browse-url �̐ݒ�
;; (global-set-key [S-mouse-2] 'browse-url-at-mouse)




;;; �^�u����2�ɐݒ�
;(setq-default tab-width 4)

;;; �^�u���̔{����ݒ�
;; (setq tab-stop-list
;;       '(2 4 6 8 10 12 14 16 18 20))
(add-to-list 'load-path "~/elisp")
(cd "~")