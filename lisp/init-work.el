;;; package --- Summary
;;; Code:
;;; Code:

;;; Commentary:
(require-package 'yasnippet)

(defun caimi-weekly ()
  "AUTO CREATE CAIMI WEEKLY TEMPLATE."
  (interactive)
  (let* ((weekly-report-name (format "caimi-weekly-%s.md" (format-time-string "%Y-%m-%d")))
         (filename (make-temp-file weekly-report-name)))
    (defun create-caimi-weekly (filename)
      (let ((buffer (find-file filename)))
        ;; (generate-new-buffer filename)
        (with-current-buffer buffer (funcall (intern "markdown-mode")))
        (yas-expand-snippet (yas-lookup-snippet "wacai weekly"))))
    (create-caimi-weekly filename)))

(provide 'init-work)
;;; init-work.el ends here
