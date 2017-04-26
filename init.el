;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it again, replace t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;; Enable visual line mode
(global-visual-line-mode 1)

;; Always follow and edit the actual file in versioning
(setq vc-follow-symlinks nil)

;; Configure backup directory and settings
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t     ; backup file the first time it's saved
      backup-by-copying t     ; use copies instead of links for backup
      version-control t	      ; user version numbers for backup
      kept-new-versions 6     ; number of newest versions to keep
      kept-old-versions 2     ; number of old versions to keep
      delete-old-versions t   ; delete excess backup files silently
      auto-save-timeout 20    ; idle time before autosave(default=30)
      auto-save-interval 200  ; keystrokes before autosave(default=300)
      )

;; MELPA configuration
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Load theme
(load-theme 'base16-tomorrow-night t)

;;;;org-mode configuration
;; Enable org-mode
(require 'org)

;; Make org-mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacs

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "DEFERRED" "|"  "DONE" "CANCELED")))
(setq org-agenda-files '("~/Dropbox/org/" "~/Dropbox/journal"))

(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cc" 'org-capture)
(setq org-log-done t)

;; Org Capture
(setq org-capture-templates
      '(("t" "Todo" entry
	 (file+headline "~/Dropbox/org/gtd.org" "Tasks")
	 "** TODO %^{Task}\n %?\n %i\nSCHEDULED: %t"
	 )))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" default)))
 '(package-selected-packages (quote (base16-theme)))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
