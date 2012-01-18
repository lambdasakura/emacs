;;--------------------------------------------------------
;; YaTeX
;;--------------------------------------------------------
(add-hook 'yatex-mode-hook
          (lambda ()
            (turn-on-auto-fill)
            (setq fill-column 120)))



;;; YaTeX-mode
(setq auto-mode-alist  (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq load-path (cons "~/.emacs.d/elisp/yatex1.74/" load-path))

(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-kanji-code 4)

;; (defvar YaTeX-dvi2-command-ext-alist
;;   '(("xdvi" . ".dvi")
;;     ("ghostview¥¥|gv" . ".ps")
;;     ("acroread¥¥|pdf¥¥|Preview¥¥|TeXShop" . ".pdf")))


(when run-w32
  (setq tex-command "platex")
  (setq dvi2-command "c:/tex/dviout/dviout")
  (setq dviprint-command-format "dvipdfmx %s "))

(when run-darwin
  (setq tex-command "~/Library/TeXShop/bin/platex2pdf-utf8"   
	dvi2-command "open -a TeXShop"))

