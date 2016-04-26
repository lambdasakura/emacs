;; javascript
(require 'js2-mode)
(require 'flycheck)
(autoload 'js2-mode "js2" nil t)
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
(add-hook 'js2-jsx-mode-hook 'flycheck-mode)
