;;; package --- Summary
;;; Code:

;;; Commentary:

(defun set-en-font (family size)
  "Set English Font.
FAMILY: Monaco; DejaVu Sans Mono; Hack;
SIZE"
  ;; https://www.emacswiki.org/emacs/SetFonts
  (set-face-attribute
   ;; :height 120 :width normal
   'default nil :family family)
  (set-face-attribute
   'default nil :height (* 10 size)))

(defun set-cjk-font (family size)
  "Set Chinese/Japan/Korea Font.
FAMILY:  Microsoft Yahei
SIZE"
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     ;; :height font-size
     (font-spec :family family :size size))))

;; Monaco
(when (and (display-graphic-p)
           (eq system-type 'darwin))
  (set-en-font "Source Code Pro" 15)
  (set-cjk-font "PingFang SC" 14))

(provide 'init-my-fonts)
;;; init-my-fonts.el ends here
