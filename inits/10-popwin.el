;;; 10-popwin.el --- popwin
;;; Commentary:
;;; Code:
(use-package popwin
  :config
  (progn (setq popwin:popup-window-position 'bottom)
         (popwin-mode 1)))
(provide '10-popwin)
;;; 10-popwin.el ends here
