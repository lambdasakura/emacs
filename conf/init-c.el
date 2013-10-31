;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; M - ;     コメントを挿入
;; M C - p   対応する開き括弧へジャンプ (関数の先頭や末尾また関数と関数の間で使うと、
;;           関数の開始部と終了部を順に上に飛んで行ける)
;; M C - n   対応する閉じ確固へジャンプ (・・・下に・・・・)
;; M - a     ステートメントの先頭へ移動
;; M - e     ステートメントの末尾へ移動
;; M - .     CTAGSで関数にジャンプ
;; M - +     CTAGSでジャンプしてた時に元の場所に戻る

(setq auto-mode-alist
      (append '(("\\.C$"  . c++-mode)
                ("\\.cc$" . c++-mode)
                ("\\.cpp$". c++-mode)
                ("\\.hh$" . c++-mode)
                ("\\.c$"  . c-mode)
                ("\\.h$"  . c++-mode))
              auto-mode-alist))
(add-hook 'c-mode-common-hook
            '(lambda ()
             (progn
	       (gtags-mode)
               (c-toggle-hungry-state 1)
               (setq c-basic-offset 4 indent-tabs-mode nil))))

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Flymake
;; (require 'flymake)

;; ;; C++
;; ;; http://d.hatena.ne.jp/pyopyopyo/20070715/
;; (defun flymake-cc-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;          (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;; ;;-Wall -Wextra -Wformat=2 -Wstrict-aliasing=2 -Wcast-qual -Wcast-align \
;; ;;-Wwrite-strings -Wconversion -Wfloat-equal -Wpointer-arith -Wswitch-enum \
;;     (list "g++" (list 
;; 		 "-Wall"
;; 		 "-Wextra"
;; 		 ;; "-Wformat=2"
;; 		 ;; "-Wstrict-aliasing=2"
;; 		 ;; "-Wcast-qual"
;; 		 ;; "-Wcast-align"
;; 		 ;; "-Wwrite-strings"
;; 		 ;; "-Wconversion"
;; 		 ;; "-Wfloat-equal"
;; 		 ;; "-Wpointer-arith"
;; 		 ;; "-Wswitch-enum"
;; 		 ;;"-fsyntax-only"
;; 		 "-W" 
;; 		 "-Wall"
;; 		 "-Wextra"
;; 		  local-file))))

;; (push '("\\.cc$" flymake-cc-init) flymake-allowed-file-name-masks)
;; (push '("\\.h$" flymake-cc-init) flymake-allowed-file-name-masks)

;; (add-hook 'c++-mode-hook
;;           '(lambda ()
;;              (flymake-mode t)))



(add-hook 'c++-mode-hook
  '(lambda ()
     ;; (flymake-mode t)
     ))
