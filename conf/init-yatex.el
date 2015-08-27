;;--------------------------------------------------------
;; YaTeX
;;--------------------------------------------------------
;; (add-hook 'yatex-mode-hook
;;           (lambda ()
;;             (turn-on-auto-fill)
;;             (setq fill-column 120)))
;;
;; ;;; YaTeX-mode
;; (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; (setq load-path (cons "~/.emacs.d/elisp/yatex1.74/" load-path))
;;
;; (setq YaTeX-latex-message-code 'utf-8)
;; (setq YaTeX-kanji-code 4)
;;
;; ;; (defvar YaTeX-dvi2-command-ext-alist
;; ;;   '(("xdvi" . ".dvi")
;; ;;     ("ghostview¥¥|gv" . ".ps")
;; ;;     ("acroread¥¥|pdf¥¥|Preview¥¥|TeXShop" . ".pdf")))
;;
;;
;; (when run-w32
;;   (setq tex-command "platex")
;;   (setq dvi2-command "c:/tex/dviout/dviout")
;;   (setq dviprint-command-format "dvipdfmx %s "))
;;
;; (when run-darwin
;;   (setq tex-command "~/Library/TeXShop/bin/platex2pdf-utf8"
;;         dvi2-command "open -a TeXShop"))


;;
;; YaTeX
;;
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-latex-message-code 'utf-8)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("TeXworks\\|texworks\\|texstudio\\|mupdf\\|SumatraPDF\\|Preview\\|Skim\\|TeXShop\\|evince\\|okular\\|zathura\\|qpdfview\\|Firefox\\|firefox\\|chrome\\|chromium\\|Adobe\\|Acrobat\\|AcroRd32\\|acroread\\|pdfopen\\|xdg-open\\|open\\|start" . ".pdf")))
;; (setq tex-command "ptex2pdf -u -l -ot \"-kanji=utf8 -no-guess-input-enc -synctex=1\"")
(setq tex-command "ptex2pdf -l -ot -kanji=utf8")
;; (setq tex-command "platex")
;(setq tex-command "platex-ng -synctex=1")
;(setq tex-command "pdflatex -synctex=1")
;(setq tex-command "lualatex -synctex=1")
;(setq tex-command "luajitlatex -synctex=1")
;(setq tex-command "xelatex -synctex=1")
;(setq tex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
;(setq tex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -e \"$dvips=q/dvips %O -z -f %S | convbkmk -u > %D/\" -e \"$ps2pdf=q/ps2pdf.exe %O %S %D/\" -norc -gg -pdfps")
;(setq tex-command "latexmk -e \"$pdflatex=q/platex-ng %O -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -norc -gg -pdf")
;(setq tex-command "latexmk -e \"$pdflatex=q/pdflatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -norc -gg -pdf")
;(setq tex-command "latexmk -e \"$pdflatex=q/lualatex %O -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -norc -gg -pdf")
;(setq tex-command "latexmk -e \"$pdflatex=q/luajitlatex %O -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -norc -gg -pdf")
;(setq tex-command "latexmk -e \"$pdflatex=q/xelatex %O -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -norc -gg -pdf")
(setq bibtex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
(setq makeindex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
;(setq dvi2-command "rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance")
(setq dvi2-command "SumatraPDF -reuse-instance")
;(setq dvi2-command "texworks")
;(setq dvi2-command "texstudio --pdf-viewer-only")
; (setq tex-pdfview-command "rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance")
(setq tex-pdfview-command "SumatraPDF -reuse-instance")
;(setq tex-pdfview-command "texworks")
;(setq tex-pdfview-command "texstudio --pdf-viewer-only")
(setq dviprint-command-format "powershell -Command \"& {$r = Write-Output %s;$p = [System.String]::Concat('\"\"\"',[System.IO.Path]::GetFileNameWithoutExtension($r),'.pdf','\"\"\"');Start-Process pdfopen -ArgumentList ('--r15','--file',$p)}\"")

(defun sumatrapdf-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process
      "fwdsumatrapdf"
      nil
      "fwdsumatrapdf"
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      (buffer-name)
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))))))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (define-key YaTeX-mode-map (kbd "C-c s") 'sumatrapdf-forward-search)))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))

;;
;; RefTeX with YaTeX
;;
;(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))
