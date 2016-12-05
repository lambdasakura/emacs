;;; 20-yatex.el --- yatex
;;; Commentary:
;;; Code:
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

(use-package yatex-mode
  :mode (("\\.tex" . yatex-mode)
         ("\\.ltx" . yatex-mode)
         ("\\.cls" . yatex-mode)
         ("\\.sty" . yatex-mode)
         ("\\.clo" . yatex-mode)
         ("\\.bbl" . yatex-mode))
  :init
  (add-hook 'yatex-mode-hook '(lambda () (auto-fill-mode -1)))
  (add-hook 'yatex-mode-hook
            '(lambda ()
               (reftex-mode 1)
               (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
               (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))
  (add-hook 'yatex-mode-hook
            (lambda ()
              (turn-on-auto-fill)
              (setq fill-column 120)))

  (when run-darwin
    (setq tex-command "~/Library/TeXShop/bin/platex2pdf-utf8"
          dvi2-command "open -a TeXShop"))

  (setq YaTeX-inhibit-prefix-letter t
        YaTeX-kanji-code nil
        YaTeX-latex-message-code 'utf-8
        YaTeX-use-LaTeX2e t
        YaTeX-use-AMS-LaTeX t
        YaTeX-dvi2-command-ext-alist
        '(("texworks\\|texworks\\|texstudio\\|mupdf\\|SumatraPDF\\|Preview\\|Skim\\|TeXShop\\|evince\\|okular\\|zathura\\|qpdfview\\|Firefox\\|firefox\\|chrome\\|chromium\\|Adobe\\|Acrobat\\|AcroRd32\\|acroread\\|pdfopen\\|xdg-open\\|open\\|start" . ".pdf")))

  (when run-darwin
    (setq tex-command "/Library/TeX/texbin/ptex2pdf -l -ot '-synctex=1'"
          bibtex-command "/Library/TeX/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi"
          makeindex-command "/Library/TeX/texbin/latexmk -e '$latex=q/uplatex %O -synctex=1 %S/' -e '$bibtex=q/upbibtex %O %B/' -e '$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/' -e '$makeindex=q/upmendex %O -o %D %S/' -e '$dvipdf=q/dvipdfmx %O -o %D %S/' -norc -gg -pdfdvi"
          dvi2-command "/usr/bin/open -a Skim"
          tex-pdfview-command "/usr/bin/open -a Skim"
          dviprint-command-format "/usr/bin/open -a \"Adobe Acrobat Reader DC\" `echo %s | gsed -e \"s/\\.[^.]*$/\\.pdf/\"`"))

  (when run-w32
    (setq tex-command "ptex2pdf -l -ot \"-kanji=utf8 -no-guess-input-enc -synctex=1\""
          bibtex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi"
          makeindex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$biber=q/biber %O --bblencoding=utf8 -u -U --output_safechars %B/\" -e \"$makeindex=q/upmendex %O -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi"
          dvi2-command "rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance"
          tex-pdfview-command "rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance"
          dviprint-command-format "powershell -Command \"& {$r = Write-Output %s;$p = [System.String]::Concat('\"\"\"',[System.IO.Path]::GetFileNameWithoutExtension($r),'.pdf','\"\"\"');Start-Process pdfopen -ArgumentList ('--r15','--file',$p)}\"")
    (add-hook 'yatex-mode-hook
              '(lambda ()
                 (define-key YaTeX-mode-map (kbd "C-c s") 'sumatrapdf-forward-search)))))
