;;GDB �֘A
;;�L�p�ȃo�b�t�@���J�����[�h
(setq gdb-many-windows t)

;;�ϐ��̏�Ƀ}�E�X�J�[�\����u���ƒl��\��
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))


;;I/O �o�b�t�@��\��
(setq gdb-use-separate-io-buffer t)

;;t �ɂ���� mini buffer �ɒl���\�������
(setq gud-tooltip-echo-area t)
