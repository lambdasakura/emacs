;;; 05-search.el --- search settings
;;; Commentary:

;;; Code:
(require 'ag)
(require 'wgrep)
(require 'wgrep-ag)

;;; eでwgrepモードにする
(setf wgrep-enable-key "e")

;;; read-only bufferにも変更を適用する
(setq wgrep-change-readonly-file t)

(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
(add-hook 'wgrep-setup-hook 'evil-normal-state)

(setq wgrep-auto-save-buffer t)
(provide '05-search.el)
;;; 05-search.el ends here
