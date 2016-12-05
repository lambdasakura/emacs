;;; 30-c-mode.el --- c mode settings
;;; Commentary:
;;; Code:
(use-package c-mode
  :mode (("\\.c$"   . c-mode))
  :init
  (require 'google-c-style)
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
  ;; M - .     CTAGSで関数にジャンプ
  ;; M - +     CTAGSでジャンプしてた時に元の場所に戻る
  (add-hook 'c-mode-common-hook 'gtags-mode)
  (add-hook 'c-mode-common-hook
            '(lambda ()
               (c-toggle-hungry-state 1)
               (setq c-basic-offset 4 indent-tabs-mode nil))))

(use-package c++-mode
  :mode (("\\.C$"   . c++-mode)
         ("\\.cc$"  . c++-mode)
         ("\\.cpp$" . c++-mode)
         ("\\.hpp$" . c++-mode)
         ("\\.h$"   . c++-mode))
  :init
  )

(use-package helm-gtags
  :config
  (progn
    (add-hook 'c-mode-hook 'helm-gtags-mode)
    ;; key bindings
    (add-hook 'helm-gtags-mode-hook
              '(lambda ()
                 (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
                 (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
                 (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
                 (local-set-key (kbd "C-t") 'helm-gtags-show-stack)
                 ;; (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)
                 ))))
(use-package gdb
  :init
  ;;有用なバッファを開くモード
  (setq gdb-many-windows t)
  ;;変数の上にマウスカーソルを置くと値を表示
  (add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))
  ;;I/O バッファを表示
  (setq gdb-use-separate-io-buffer t)
  ;;t にすると mini buffer に値が表示される
  (setq gud-tooltip-echo-area t))


(provide '30-c-mode.el)
;;; 30-c-mode.el ends here
