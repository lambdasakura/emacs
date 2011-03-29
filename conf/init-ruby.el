;;---------------------------------------------------
;; Ruby関連
;;---------------------------------------------------
(require 'cl)
;;(require 'rails)
(require 'inf-ruby)
;;(require 'ruby-block)

(custom-set-faces '(flymake-errline ((((class color)) (:background "firebrick")))) 
		  '(flymake-warnline ((((class color)) (:background "IndianRed"))))) 

(custom-set-faces '(flymake-errline ((((class color)) (:background "blue")))) 
		  '(flymake-warnline ((((class color)) (:background "blue"))))) 

;;
;; ruby mode
;;
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)

(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist)) 

(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda () (inf-ruby-keys)))

;;
;; ruby-electric
;;
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;;
;; ruby-block
;;
;;(ruby-block-mode t)
;;(setq ruby-block-highlight-toggle t) ;; ミニバッファに表示し, かつ, オーバレイする.


;;
;;  rubydb
;;
;;(autoload 'rubydb "rubydb3x"
;;  "run rubydb on program file in buffer *gud-file*.
;;the directory containing file becomes the initial working directory
;;and source-file directory for your debugger." t)

;; ;;
;; ;; Rails
;; ;;
;; (setq rails-use-mongrel t)
;; (defun try-complete-abbrev (old)
;;   (if (expand-abbrev) t nil))
;; (setq hippie-expand-try-functions-list
;;       '(try-complete-abbrev
;; 	try-complete-file-name
;; 	try-expand-dabbrev))

;; (autoload 'newsticker-start "newsticker" "Start Newsticker" t)
;; (autoload 'newsticker-show-news "newsticker" "Goto Newsticker buffer" t)
;; (add-hook 'newsticker-mode-hook 'imenu-add-menubar-index)
;; (setq newsticker-url-list
;;       '(("slashdot" "http://slashdot.jp/slashdotjp.rss")
;; 	("秋葉blog" "http://www.akibablog.net/atom.xml")
;; 	("痛いニュース" "http://blog.livedoor.jp/dqnplus/index.rdf")
;; 	("cnet" "http://japan.cnet.com/rss/index.rdf")
;;         ))

;; (autoload 'w3m-region "w3m"
;;   "Render region in current buffer and replace with result." t)
;; (setq newsticker-html-renderer 'w3m-region)
