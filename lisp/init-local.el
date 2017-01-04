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
(custom-set-variables
 '(user-full-name "Junjia Ni")
 '(user-mail-address "creamidea@gmail.com")
 '(display-battery-mode t)
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 ;; sanityinc-tomorrow-light/eighties/night
 ;; snaityinc-solarized-light/dark
 ;; base16-default-dark
 '(custom-enabled-themes (quote (base16-default-dark))))

;; font family: Hack, Monaco
(custom-set-faces
 ;; Monaco; DejaVu Sans Mono;
 '(default ((t (:family "Monaco" :weight Regular :height 120 :width normal)))))
;;; Setting Chinese Font 中文字体
;; Microsoft Yahei
;; 15
(let ((font-family "PingFang SC")
      (font-size 12))
  (if (display-graphic-p)
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font
         (frame-parameter nil 'font)
         charset
         (font-spec :family font-family :size font-size :height font-size)))))

;; themes:
;; '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
;; sanityinc-tomorrow-night
;; sanityinc-solarized-light
;; sanityinc-solarized-dark
;; sanityinc-tomorrow-eighties

;; (x-focus-frame nil)
;; :font Menlo Monaco Fira-Mono Source-Code-Pro
;; (let ((my-favourite-font "Fira Mono")
;;       (my-font-size "16"))
;;   (add-to-list 'initial-frame-alist `(font . ,(concat my-favourite-font "-" my-font-size)))
;;   (add-to-list 'default-frame-alist `(font . ,(concat my-favourite-font "-" my-font-size)))
;;   (set-face-attribute 'default nil :family my-favourite-font :height 160))

;; emacs-color-themes
;; https://github.com/owainlewis/emacs-color-themes
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-themes/themes")
;; (load-theme 'brin t)
;; (load-theme 'junio t)

;; solarized
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;; (load-theme 'solarized t)
;; (custom-set-variables
;;  '(solarized-termcolors 256)
;;  '(solarized-contrast 'high)
;;  '(solarized-visibility 'high)
;;  '(solarized-degrade t))
;; (set-frame-parameter nil 'background-mode 'dark)
;; (set-terminal-parameter nil 'background-mode 'dark)
;; (enable-theme 'solarized)

;; tomorrow-theme
;; (require 'color-theme-sanityinc-tomorrow)
;; (load-theme 'color-theme-sanityinc-tomorrow-night)
;; (load-file "~/.emacs.d/themes/tomorrow-theme/color-theme-tomorrow.el")
;; (require 'color-theme-tomorrow)
;; (load-theme 'tomorrow-night-bright t)
;; (load-theme 'tomorrow-night t)
;; (load-theme 'tomorrow-night tomorrow-night-eighties t)

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

;; Require
;; yasnippet
(require-package 'yasnippet)
;; (after-load 'yasnippet
;;   (yas-global-mode 1))
(yas-global-mode 1)


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

;; (server-start)

(provide 'init-local)
;;; init-local.el ends here
