(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
		("SConscript\\'" . python-mode))
              auto-mode-alist))

;; https://github.com/gregsexton/ob-ipython/issues/28#issuecomment-182346001
;; (setq python-shell-completion-native-enable nil)
;; using python3: http://stackoverflow.com/a/17139416/1925954
;; (setq python-version-checked t)
;; (setq python-shell-interpreter "python3")
;; or you can set by customize (M-x customize)

(require-package 'pip-requirements)

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (add-hook 'python-mode-hook
                (lambda () (sanityinc/local-push-company-backend 'company-anaconda))))))


(provide 'init-python-mode)
