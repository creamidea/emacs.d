(require-package 'exec-path-from-shell)

(after-load 'exec-path-from-shell
  (dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO" "LANG" "LC_CTYPE"))
    (add-to-list 'exec-path-from-shell-variables var)))

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Window-Systems.html
(when (memq window-system '(w32 pc))
  "set path and exec-path."
  (let ((mypaths '("C:/Program Files/Git/bin/"
                   "C:/Program Files/Git/cmd/"
                   "C:/Program Files/Git/usr/bin"
                   "C:/Program Files/Git/mingw64/bin/"
                   "C:/Program Files/Git/mingw64/libexec/git-core/"
                   "C:/Program Files/Steel Bank Common Lisp/1.3.9/"
                   "C:/Program Files (x86)/GNU/gnutls-3.4.13-w32/bin/")))
    (setenv "PATH" (concat (mapconcat 'identity mypaths ";") ";" (getenv "PATH")))
    (setq exec-path (append mypaths (list "." exec-directory)))))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
