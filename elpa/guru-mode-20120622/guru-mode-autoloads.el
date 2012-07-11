;;; guru-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (guru-mode guru-global-mode) "guru-mode" "guru-mode.el"
;;;;;;  (20475 52092))
;;; Generated autoloads from guru-mode.el

(defvar guru-global-mode nil "\
Non-nil if Guru-Global mode is enabled.
See the command `guru-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `guru-global-mode'.")

(custom-autoload 'guru-global-mode "guru-mode" nil)

(autoload 'guru-global-mode "guru-mode" "\
Toggle Guru mode in every possible buffer.
With prefix ARG, turn Guru-Global mode on if and only if
ARG is positive.
Guru mode is enabled in all buffers where
`guru-on' would do it.
See `guru-mode' for more information on Guru mode.

\(fn &optional ARG)" t nil)

(autoload 'guru-mode "guru-mode" "\
A minor mode that teaches to help you use Emacs the way it was intended to be used.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("guru-mode-pkg.el") (20475 52092 470197))

;;;***

(provide 'guru-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; guru-mode-autoloads.el ends here
