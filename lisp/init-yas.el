;; yasnippet
(require-package 'yasnippet)
;; (after-load 'yasnippet
;;   (yas-global-mode 1))
(eval-after-load 'yasnippet
  (progn
    (setq yas-snippet-dirs
          '("~/.emacs.d/snippets"))
    (yas-global-mode t)))

(provide 'init-yas)
;;; init-yas.el ends here
