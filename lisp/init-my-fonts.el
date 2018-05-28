;;; package --- Summary
;;; Code:

;;; Commentary:

(defun set-en-font (font size)
  "Set English Font.
FONT: Monaco; DejaVu Sans Mono; Hack; Source Code Pro
SIZE"
  ;; https://www.emacswiki.org/emacs/SetFonts
  ;; (set-face-attribute
  ;;  ;; :height 120 :width normal
  ;;  'default nil :family family :height (* 10 size))
  (set-face-attribute
   ;; :height 120 :width normal
   'default nil :font (format "%s-%d" font size)))

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

;; Monaco/Source Code Pro/Iosevka
(when (and (display-graphic-p)
           (eq system-type 'darwin))
  (progn
    (set-en-font "Source Code Pro" 15)
    (set-cjk-font "PingFang SC" 14)))


(provide 'init-my-fonts)
;;; init-my-fonts.el ends here
