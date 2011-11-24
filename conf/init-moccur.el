;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color-moccur
;; http://www.emacswiki.org/emacs/color-moccur.el
;; http://www.emacswiki.org/emacs/moccur-edit.el
(require 'color-moccur)
(require 'moccur-edit)


;;; color-moccur.el�̐ݒ�
(require 'color-moccur)
;; �����̌������A����̃t�F�C�X�̂݃}�b�`���̋@�\��L���ɂ���
;; �ڍׂ� http://www.bookshelf.jp/soft/meadow_50.html#SEC751
(setq moccur-split-word t)
;; migemo��require�ł�����Ȃ�migemo���g��
(when (require 'migemo nil t) ;��O������non-nil����load�ł��Ȃ������ꍇ�ɃG���[�ł͂Ȃ�nil��Ԃ�
  (setq moccur-use-migemo t))

;;; anything-c-moccur�̐ݒ�
(require 'anything-c-moccur)
;; �J�X�^�}�C�Y�\�ϐ��̐ݒ�(M-x customize-group anything-c-moccur �ł��ݒ�\)
(setq anything-c-moccur-anything-idle-delay 0.2 ;`anything-idle-delay'
      anything-c-moccur-higligt-info-line-flag t ; `anything-c-moccur-dmoccur'�Ȃǂ̃R�}���h�Ńo�b�t�@�̏����n�C���C�g����
      anything-c-moccur-enable-auto-look-flag t ; ���ݑI�𒆂̌��̈ʒu�𑼂�window�ɕ\������
      anything-c-moccur-enable-initial-pattern t) ; `anything-c-moccur-occur-by-moccur'�̋N�����Ƀ|�C���g�̈ʒu�̒P��������p�^�[���ɂ���

;;; �L�[�o�C���h�̊���(�D�݂ɍ��킹�Đݒ肵�Ă�������)
(global-set-key (kbd "M-o") 'anything-c-moccur-occur-by-moccur) ;�o�b�t�@������
(global-set-key (kbd "C-M-o") 'anything-c-moccur-dmoccur) ;�f�B���N�g��
(add-hook 'dired-mode-hook ;dired
          '(lambda ()
             (local-set-key (kbd "O") 'anything-c-moccur-dired-do-moccur-by-moccur)))