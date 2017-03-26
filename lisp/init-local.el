;;; package --- Summary
;;; Commentary:

;;; Code:

;; (add-hook 'window-configuration-change-hook
;;           (lambda ()
;;             (setq frame-title-format
;;                   (concat
;;                    ;; "creamidea@gmail.com: "
;;                    ;; invocation-name "@" system-name ": "
;;                    "Au9ustTrek@" system-name ":"
;;                    (replace-regexp-in-string
;;                     (concat "/home/" user-login-name) "~"
;;                     (or buffer-file-name "%b"))))))

;; or use (string-equal system-type "windows-nt")
(when window-system
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
;; (set-frame-parameter (selected-frame) 'alpha '(95 95))
;; (add-to-list 'default-frame-alist '(alpha 95 95))

(custom-set-variables
 '(user-full-name "Junjia Ni")
 '(user-mail-address "creamidea@gmail.com")
 '(display-battery-mode t)
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))

;; Setting theme and font
(require-package 'base16-theme)
(eval-after-load 'base16-theme
  (custom-set-variables
   ;; https://chriskempson.github.io/base16/
   ;; sanityinc-tomorrow-light/eighties/night
   ;; snaityinc-solarized-light/dark
   ;; base16-paraiso
   '(custom-enabled-themes (quote (base16-tomorrow-night)))))
(let ((en-font-family "Monaco") ;; Monaco; DejaVu Sans Mono; Hack;
      (cn-font-family "PingFang SC") ;; Microsoft Yahei
      (font-size 12))
  (if (display-graphic-p)
      (progn
        ;; Setting English Font
        (custom-set-faces
         ;; :height 120 :width normal
         '(default ((t (:family en-font-family :weight Regular :size font-size)))))
        ;; Setting Chinese Font 中文字体
        (dolist (charset '(kana han symbol cjk-misc bopomofo))
          (set-fontset-font
           (frame-parameter nil 'font)
           charset
           ;; :height font-size
           (font-spec :family cn-font-family :size (+ 1 font-size)))))))

;; Require
;; yasnippet
(require-package 'yasnippet)
;; (after-load 'yasnippet
;;   (yas-global-mode 1))
(eval-after-load 'yasnippet
  (progn
    (setq yas-snippet-dirs
          '("~/.emacs.d/snippets"))
    (yas-global-mode t)))

(require 'epa-file)
;; (setq epa-file-select-keys nil)
(global-set-key (kbd "C-c g e") 'epa-encrypt-region)
(global-set-key (kbd "C-c g d") 'epa-decrypt-region)
(global-set-key (kbd "C-c g v") 'epa-verify-region)
(global-set-key (kbd "C-c g s") 'epa-sign-region)

(defun insert-comment ()
  (interactive)
  (insert
   (format
    "/**%s\n */"
    (mapconcat 'identity
               (mapcar
                (lambda (x) (append myComment (format "\n * %s" x)))
                (split-string (buffer-string) "\n" t)) " "))))

(add-to-list 'load-path "~/Repository/org-mode/lisp")
(add-to-list 'load-path "~/Repository/org-mode/contrib/lisp" t)

;; auto mode alist
;; (add-to-list 'auto-mode-alist '("\\.gpg\\'" . text-mode))


;; keymap binding
;; set M-space to setmark, repalce C-@ with C-space
;; (global-set-key (kbd "M-<SPC>") 'set-mark-command)
(defun find-git-repo (filename &optional wildcards)
  "Find the git repo by FILENAME and optional WILDCARDS."
  (interactive
   (find-file-read-args "Find Git Repo: "
                        (confirm-nonexistent-file-or-buffer)))
  (magit-status filename))
(global-set-key (kbd "C-x C-g") 'find-git-repo)

;; (server-start)

(provide 'init-local)
;;; init-local.el ends here
