;;--------------------------------------------------------
;; YaTeX
;;--------------------------------------------------------
(add-hook 'yatex-mode-hook
          (lambda ()
            (turn-on-auto-fill)
            (setq fill-column 120)
            ))
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-kanji-code 4)
(defvar YaTeX-dvi2-command-ext-alist
  '(("xdvi" . ".dvi")
    ("ghostview¥¥|gv" . ".ps")
    ("acroread¥¥|pdf¥¥|Preview¥¥|TeXShop" . ".pdf")))

(setq tex-command "~/Library/TeXShop/bin/platex2pdf-utf8"   ; eucの場合はplatex2pdf-euc
     dvi2-command "open -a TeXShop")

