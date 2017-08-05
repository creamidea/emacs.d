;;; package --- Summary
;;; Commentary:


;;; Code:
(setq path-to-etags "/usr/local/bin/etags")
(defun create-tags (dir-name)
  "CREATE TAGS FILE.
DIR-NAME."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name \"*.[ch]\" | %s -" dir-name path-to-etags)))

(provide 'init-etags)
;;; init-etags.el ends here
