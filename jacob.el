(require 'color-theme)
(load-file "~/.emacs.d/elpa-to-submit/twilight.el")
(color-theme-twilight)
;;(color-theme-dark-blue)

(defun shell-new-shell (name-of-new-shell-buffer)
  (interactive "MName of shell buffer: ")
  "Create a new shell buffer with name NAME."
  (shell (concat "*" name-of-new-shell-buffer "*")))

;; ================
;; shell mode
;; ================
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil)
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq comint-password-prompt-regexp "\\(\\([Oo]ld \\|[Nn]ew \\|'s \\|\\[sudo\\] \\|login \\|Kerberos \\|CVS \\|UNIX \\| SMB \\|^\\)[Pp]assword\\( (again)\\)?\\|pass phrase\\|\\(Enter\\|Repeat\\|Bad\\) passphrase\\)\\(?:, try again\\)?\\(?: for [^:]+\\)?:\\s *\\'")
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook '(lambda () (define-key shell-mode-map "\C-c\M-n" 'shell-new-shell)))
(setq ssh-directory-tracking-mode t)

;; ================
;; dired mode
;; ================
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map "\C-c\C-c" 'wdired-change-to-wdired-mode)))
