;;; package --- Summary
;;; Commentary:

;;; Code:

(add-hook 'window-configuration-change-hook
          (lambda ()
            (setq frame-title-format
                  (concat
                   ;; "creamidea@gmail.com: "
                   ;; invocation-name "@" system-name ": "
                   "Au9ustTrek@" system-name ":"
                   (replace-regexp-in-string
                    (concat "/home/" user-login-name) "~"
                    (or buffer-file-name "%b"))))))

;; or use (string-equal system-type "windows-nt")
(when (memq window-system '(w32 pc))
  "1) try to improve slow performance on windows."
  (set-frame-size (selected-frame) 80 24)
  (setq w32-get-true-file-attributes nil))
(setq default-directory "~/Repository/")
(setq make-backup-files nil)
(setq vc-handled-backends nil)
(setq vc-make-backup-files t)
(setq visible-bell t)
;; (setq linum-mode t)
;; (set-language-environment "UTF-8")
;; (format-time-string "%d %b %Y")
;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(99 99))
(add-to-list 'default-frame-alist '(alpha 99 99))

(custom-set-variables
 '(user-full-name "Junjia Ni")
 '(user-mail-address "creamidea@gmail.com")
 '(display-battery-mode t)
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(flycheck-json-python-json-executable "python3")
 '(python-shell-completion-native-enable nil)
 '(python-shell-interpreter "python3")
 '(markdown-command "/usr/local/bin/kramdown")
 '(session-use-package t nil (session)))

(defun insert-comment ()
  (interactive)
  (insert
   (format
    "/**%s\n */"
    (mapconcat 'identity
               (mapcar
                (lambda (x) (append myComment (format "\n * %s" x)))
                (split-string (buffer-string) "\n" t)) " "))))

;; org-mode using elpa
;; (add-to-list 'load-path "~/Repository/org-mode/lisp")
;; (add-to-list 'load-path "~/Repository/org-mode/contrib/lisp" t)

;; auto mode alist
;; (add-to-list 'auto-mode-alist '("\\.gpg\\'" . text-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.babelrc\\'" . json-mode))

;; keymap binding
;; set M-space to setmark, repalce C-@ with C-space
;; (global-set-key (kbd "M-<SPC>") 'set-mark-command)
;; (defun find-git-repo (filename &optional wildcards)
;;   "Find the git repo by FILENAME and optional WILDCARDS."
;;   (interactive
;;    (find-file-read-args "Find Git Repo: "
;;                         (confirm-nonexistent-file-or-buffer)))
;;   (magit-status filename))
;; (global-set-key (kbd "C-c C-g") 'find-git-repo)

;; (server-start)

(provide 'init-local)
;;; init-local.el ends here
