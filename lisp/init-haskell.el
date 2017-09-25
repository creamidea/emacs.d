(require-package 'haskell-mode)


;; Use intero for completion and flycheck

(when (maybe-require-package 'intero)
  (after-load 'haskell-mode
    (add-hook 'haskell-mode-hook 'intero-mode)
    (add-hook 'haskell-mode-hook 'eldoc-mode)
    )
  (after-load 'intero
    ;; Don't clobber sanityinc/counsel-search-project binding
    (define-key intero-mode-map (kbd "M-?") nil)
    (after-load 'flycheck
      (flycheck-add-next-checker 'intero
                                 '(warning . haskell-hlint)))))


(add-auto-mode 'haskell-mode "\\.ghci\\'")


;; Indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)



;; Source code helpers

(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

(when (maybe-require-package 'hindent)
  (add-hook 'haskell-mode-hook 'hindent-mode))

(after-load 'haskell-mode
  (define-key haskell-mode-map (kbd "C-c h") 'hoogle)
  (define-key haskell-mode-map (kbd "C-o") 'open-line))


(after-load 'page-break-lines
  (push 'haskell-mode page-break-lines-modes))



(provide 'init-haskell)
