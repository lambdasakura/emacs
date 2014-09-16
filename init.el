;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs setting file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))

(add-to-load-path "~/.emacs.d"
                  "~/.emacs.d/lisp/skk"
                  "~/.emacs.d/elisp"
                  "~/.emacs.d/conf"
                  "~/.emacs.d/elisp/howm-1.4.0")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Loading elisps
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic Settings

(load "init-utils")
(when run-darwin (load "init-mac"))
;; (global-set-key [M-kanji] 'ignore)
;; (global-set-key [kanji] 'ignore)
;; (global-set-key [C-S-space] 'ignore)
(load "init-utils")
;; (load "init-networking")
(load "init-package")
(load "init-common")
(load "init-color")

(load "init-emacs-nav")
(load "init-recentf")

;; Code Completion
(load "init-auto-complete")
(load "init-yasnippet")

;; Window Management
(load "init-elscreen")
(load "init-popwin")

;; Moccur
(load "init-moccur")

;; Magit
(load "init-magit")


(load "init-howm")
;; (load "init-w3m")

;; Programming Environment

;; (load "init-c")
;; (load "init-gdb")
;; (load "init-gtags")
;; (load "init-ruby")
;; (load "init-python")
;; (load "init-markdown")
;; (load "init-javascript")
(load "init-slime")
;; (load "init-haskell")

;; Extra
;; (load "init-yatex")
;;(load "init-caede")

(load "init-helm")
(load "init-whitespace")


(require 'evil)
(evil-mode 1)


(cd "~")
(require 'evil)
(evil-mode 1)
(progn
  (defun gcode-lookup ()
    "カーソル位置のシンボルをGoogle Codeで検索(lisp決め打ち)"
    (interactive)
    (browse-url
     (format "http://www.google.com/codesearch?q=%s+lang:%s+file:\\.%s$&hl=ja&num=20"
             (thing-at-point 'symbol) "lisp" "lisp")))

  (define-key slime-mode-map [(control ?c) (control ?d) ?g] 'gcode-lookup))
>>>>>>> Stashed changes
