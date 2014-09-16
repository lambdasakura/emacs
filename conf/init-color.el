;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(custom-set-faces
  '(default ((t (:background "black" :foreground "white"))))
 ;;'(default ((t (:background "white" :foreground "black"))))
 '(cursor ((t (:background "Green" :foreground "green"))))
 ;; '(font-lock-builtin-face ((((class color) (min-colors 88) (background dark)) (:foreground "cyan"))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background dark)) (:foreground "SkyBlue"))))
 '(font-lock-string-face  ((((class color) (min-colors 88) (background dark)) (:foreground "SkyBlue"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "DeepSkyBlue2"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:bold t :foreground "skyblue1"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 88) (background dark)) (:bold t :foreground "skyblue1"))))
 '(font-lock-type-face ((((class color) (min-colors 88) (background dark)) (:bold t :foreground "skyblue1"))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background dark)) (:foreground "yellow"))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background dark)) (:foreground "red"))))
 '(font-lock-constant-face ((((class color) (min-colors 88) (background dark)) (:bold t :foreground "tomato"))))
 '(mell-region-face ((((class color) (min-colors 88) (background dark)) (:foreground "white" :background "MediumSlateBlue"))
                     (((class color) (min-colors 88) (background light)) (:foreground "white" :background "MediumSlateBlue"))))
 '(sense-region-face ((((class color) (min-colors 88) (background dark)) (:foreground "white" :background "MediumSlateBlue"))
                      (((class color) (min-colors 88) (background light)) (:foreground "white" :background "MediumSlateBlue"))))
 '(region ((((class color) (min-colors 88) (background dark)) (:foreground "white" :background "MediumSlateBlue"))
           (((class color) (min-colors 88) (background light)) (:foreground "white" :background "MediumSlateBlue"))))
 '(highlight ((((class color) (min-colors 88) (background light)) (:italic t :bold t :foreground "white" :background "MediumSlateBlue"))
              (((class color) (min-colors 88) (background dark)) (:italic t :bold t :foreground "white" :background "MediumSlateBlue"))))
 '(modeline ((((class color) (min-colors 88) (background dark)) (:foreground "gray"))))
 '(minibuffer-prompt ((((class color) (min-colors 88) (background dark)) (:foreground "Green"))))
 '(mode-line-inactive ((((class color) (min-colors 88) (background dark)) (:foreground "black"))))
 '(which-func ((t (:foreground "deep sky blue")))))



(setq transient-mark-mode t)
