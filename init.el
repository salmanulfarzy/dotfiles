
;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it again, replace t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;; Enable visual line mode
(global-visual-line-mode 1)

;; Always follow and edit the actual file in versioning
(setq vc-follow-symlinks nil)
(setq read-file-name-completion-ignore-case t)

;; Highlight brackets if visible, else entire expression
(setq show-paren-style 'mixed)

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

;; Export to markdown
(require 'ox-md nil t)

;; Enable org-journal
(require 'org-journal)
(setq org-journal-dir "~/Dropbox/journal/")
(setq org-journal-file-format "%Y-%m-%d.org")
(setq org-journal-date-format "%A, %d %B %Y")

(defun get-journal-file-today()
    (let ((daily-name (format-time-string "%Y-%m-%d")))
    (expand-file-name (concat org-journal-dir daily-name ".org"))))

(defun journal-file-today()
  "Create and load a journal file based on today's date"
  (interactive)
  (find-file (get-journal-file-today)))

(global-set-key (kbd "C-c f j") 'journal-file-today)

;; Org Capture
(setq org-capture-templates
      '(("t" "Todo" entry
	 (file+headline "~/Dropbox/org/gtd.org" "Tasks")
	 "** TODO %^{Task}\n %?\n %i\nSCHEDULED: %t")
	("j" "Journal Entry" entry
	 (file (get-journal-file-today))
	 "** %<%H:%M> %?\n")))

;; Org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(setq git-commit-summary-max-length 50)
(setq git-commit-fill-column 72)

;; Dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)


;; Undo tree
(require 'undo-tree)
(global-undo-tree-mode 1)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" default)))
 '(org-agenda-files
   (quote
    ("/Users/Salman/Dropbox/journal/2017-04-23.org" "/Users/Salman/Dropbox/journal/2017-04-24.org" "/Users/Salman/Dropbox/journal/2017-04-25.org" "/Users/Salman/Dropbox/journal/2017-04-27.org" "/Users/Salman/Dropbox/journal/2017-04-28.org" "/Users/Salman/Dropbox/journal/2017-05-01.org" "/Users/Salman/Dropbox/journal/2017-05-04.org" "/Users/Salman/Dropbox/journal/2017-05-14.org" "/Users/Salman/Dropbox/journal/2017-05-15.org" "/Users/Salman/Dropbox/journal/2017-05-16.org" "/Users/Salman/Dropbox/journal/2017-05-17.org" "/Users/Salman/Dropbox/journal/2017-05-20.org")))
 '(package-selected-packages (quote (magit org-journal base16-theme)))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
