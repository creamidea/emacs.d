(require 'epa-file)
;; (setq epa-file-select-keys nil)
(global-set-key (kbd "C-c g e") 'epa-encrypt-region)
(global-set-key (kbd "C-c g d") 'epa-decrypt-region)
(global-set-key (kbd "C-c g v") 'epa-verify-region)
(global-set-key (kbd "C-c g s") 'epa-sign-region)

(provide 'init-epa)
;;; init-epa.el ends here
