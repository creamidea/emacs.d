;;; package --- Summary
;;; Code:

;;; Commentary:
;;;   Setting theme

(require-package 'base16-theme)
(eval-after-load 'base16-theme
  (custom-set-variables
   ;; https://chriskempson.github.io/base16/
   '(custom-enabled-themes (quote (base16-material-darker)))))

;;; set themes dracula-theme
;; (require-package 'dracula-theme)
;; (eval-after-load 'dracula-theme
;;   (custom-set-variables
;;    '(custom-enabled-themes (quote (dracula)))))


(provide 'init-my-themes)
;;; init-my-themes.el ends here
