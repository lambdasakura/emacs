;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color-moccur
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; http://www.emacswiki.org/emacs/moccur-edit.el
(require 'moccur-edit)

;; �����̌������A����̃t�F�C�X�̂݃}�b�`���̋@�\��L���ɂ���
(setq moccur-split-word t)

;; migemo��require�ł�����Ȃ�migemo���g��
(when (require 'migemo nil t)
  (setq moccur-use-migemo t))


