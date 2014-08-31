; Set up UTF-8
; -----------------------------------------------------

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

; General Settings
; -----------------------------------------------------

(setq tab-width 2)
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)
(setq global-hl-line-mode t)
(setq make-backup-files nil)
(setq compilation-ask-about-save nil)
(savehist-mode 1)
(global-linum-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)
(setq show-trailing-whitespace t)

;; Instanlty quitting emacs using C-x C-c
(global-set-key (kbd "C-x C-c")
                #'(lambda ()
                    (interactive)
                    (save-buffers-kill-terminal t)))

; Package-Management
; -----------------------------------------------------

(require 'package)

;; List the packages you want to install
(setq package-list '(cider
		     org
		     markdown-mode
		     evil
		     evil-leader
		     smartparens
		     flx-ido
		     projectile
		     rainbow-delimiters
		     undo-tree
		     git-gutter
		     git-gutter-fringe
		     magit
		     slime
		     helm
		     helm-swoop
		     helm-google
		     smex
		     company
		     paredit
		     multiple-cursors
		     dot-mode
		     flycheck))

;; List the repositories
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)

;; Activate all the packages (in particular autoloads)
(package-initialize)

;; Fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; Install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

; Mode-specific settings
; -----------------------------------------------------

;; Flx-ido
; -----------------------------------------------------

(require 'flx-ido)

(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

;; Dot-mode
; -----------------------------------------------------

(require 'dot-mode)

;; Dot-mode is always on (use C-. to repeat the last edit)
(add-hook 'find-file-hooks 'dot-mode-on)
(global-set-key [(control ?.)] 'dot-mode-execute)

;; Undo-tree
; -----------------------------------------------------

(require 'undo-tree)

;; Enable Global Undo-Tree
(global-undo-tree-mode)

;; New undo keybinding
(global-set-key (kbd "C--") 'undo-tree-undo)
(global-set-key (kbd "M--") 'undo-tree-redo)

;; Browse Kill-Ring
; -----------------------------------------------------

;; Browse the kill-ring via M-y
(global-set-key (kbd "M-y") 'browse-kill-ring)

;; Org-mode
; -----------------------------------------------------

(require 'org)

;; Global Org-Keybindings
;; --------------------

;; Capture
(global-set-key (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "<f9>") 'org-capture)

;; Agenda
(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "<f7>") 'org-agenda)

;; Store a link
(global-set-key (kbd "C-c l") 'org-store-link)

;; Switch org-buffer
(global-set-key (kbd "C-c b") 'org-iswitchb)

;; General Settings
;; --------------------

;; Show only one star per heading
(setq org-hide-leading-stars 'hidestars)

;; Follow org-links with return
(setq org-return-follows-links t)

;; German localization of org
(setq org-export-default-language "de")
(setq calendar-week-start-day 1
      calendar-day-name-array
      ["Sonntag" "Montag" "Dienstag" "Mittwoch"
       "Donnerstag" "Freitag" "Samstag"]
      calendar-month-name-array
      ["Januar" "Februar" "März" "April" "Mai"
       "Juni" "Juli" "August" "September"
       "Oktober" "November" "Dezember"])

;; TODO-States
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s!)" "DELAY(g@/!)"
		  "|" "DONE(d!)" "CANCELED(c@)")))

;;  TODO-States face-settings
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "#FF0055" :weight bold))
				("STARTED" (:foreground "#FF4000" :weight bold))
				("DELAY" (:foreground "#4EB4FA" :weight bold))
				("DONE" (:foreground "#B1D631" :weight bold))
				("CANCELED" (:foreground "#ED0028" :weight bold))
				("APPT" (:foreground "#7E40A5" :weight bold))))

;; Log TODO-State-Changes
(setq org-log-done 'time)

;; Clocking
;; --------------------

(add-hook 'org-mode-hook
					'(define-key org-mode-map (kbd "C-c C-i") 'org-clock-in)
					'(define-key org-mode-map (kbd "C-c C-o") 'org-clock-out))

;; Resume clocking tasks when emacs is restarted
(org-clock-persistence-insinuate)

;; Longer clock-history
(setq org-clock-history-length 35)

;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)

;; Save clock-history
(setq org-clock-persist t)

;; Start agenda with clock-report
(setq org-agenda-start-with-clockreport-mode t)

;; No links, max. 4 levels
(setq org-agenda-clockreport-parameter-plist (quote (:link t :maxlevel 4)))

;; Capture Templates
;; --------------------

(setq org-capture-templates
      '(("t" "Aufgabe" entry (file+heading "~/org/gtd.org" "Erledigungen")
	 "** TODO %?")
	("z" "Journal" entry (file+datetree "~/org/journal.org")
	 "* %?\n Entered on %U\n %i")))

;; Agenda Stuff
;; --------------------

;; Hide Tasks, which are already done
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)

;; Also log custom drawers
(setq org-log-into-drawer t)

;; Tag tasks as someday
(setq org-agenda-filter-preset '(-someday))

;; Start Agenda in a Daily-View
(setq org-agenda-span 1)

;; Custom Agenda-Views
(setq org-agenda-custom-commands
      ( quote (
	       ("s" "SOMEDAY" tags "someday" ((org-agenda-filter-preset
					       '("+someday"))(org-agenda-todo-ignore-with-date nil)))
	       ("i" todo "important"))))

;; Set-up my agenda-files
(setq org-agenda-files '("~/org/"))

;; ParEdit
;; --------------------

(require 'paredit)
(add-hook 'clojure-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'cider-repl-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode 1)))

;; Company-Mode
;; --------------------

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.1)
(setq company-tooltip-limit 20)
(setq company-echo-delay 0)
(add-to-list 'company-backends 'company-dabbrev t)
(add-to-list 'company-backends 'company-ispell t)
(add-to-list 'company-backends 'company-files t)

;; Git-Gutter
;; --------------------

;; (require 'git-gutter)
;; (require 'git-gutter-fringe)
;; (global-git-gutter-mode t)
;; (git-gutter:linum-setup)

;; (when window-system
;;   (custom-set-variables
;;    '(git-gutter:modified-sign "~")
;;    '(git-gutter:added-sign "+")
;;    '(git-gutter:deleted-sign "-")))
;; (set-face-foreground 'git-gutter:modified "yellow")

;; Helm
;; --------------------

(require 'helm)

;; Configure helm-mini
(defun helm-mini ()
  "Preconfigured `helm' lightweight version \(buffer -> recentf\)."
  (interactive)
  (require 'helm-files)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm-other-buffer '(helm-source-buffers-list
                         helm-source-recentf
                         helm-source-buffer-not-found)
                       "*helm mini*")))
(global-set-key (kbd "C-x C-b") 'helm-mini)

;; Using helm-M-x instead of plain M-x
(global-set-key (kbd "M-x") 'helm-M-x)

; Emacs-Theme
; -----------------------------------------------------

;; Adding the themes to path
(add-to-list 'load-path "~/.config/emacs/themes/hemisu-theme/" t)
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/" t)
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/hemisu-theme/" t)

;; Load the Colorscheme
(require 'hemisu-theme)
(load-theme 'hemisu-light t)

;; Rainbow-Delimiters
;; --------------------

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; Gnus Gmail-Settings
;; --------------------

(setq gnus-select-method
      '(nnimap "gmail"
	       (nnimap-address "imap.gmail.com")
	       (nnimap-server-port 993)
	       (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 687
				   "waterkoka@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp-gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(defun my-gnus-group-list-subscribed-groups ()
  "List all subscribed groups with or without un-read messages"
  (interactive)
  (gnus-group-list-all-groups 5))


(add-hook 'gnus-group-mode-hook
	  ;; List all the subscribed groups even they contain zero un-read messages
	  (lambda () (local-set-key "o" 'my-gnus-group-list-subscribed-groups)))

(custom-set-faces
 '(default ((t (:height 110 :family "Inconsolata"))))
 '(helm-buffer-not-saved ((t (:foreground "#FF0055"))))
 '(helm-buffer-process ((t (:foreground "#FF4000"))))
 '(helm-candidate-number ((t (:background "#FF0055" :foreground "#FFFFFF"))))
 '(helm-header ((t (:background "#FF0055" :foreground "#FFFFFF"))))
 '(helm-prefarg ((t (:foreground "#ff0055"))))
 '(helm-selection ((t (:background "#BBBBBB" :foreground "#FFFFFF"))))
 '(helm-source-header ((t (:foreground "black" :weight bold :height 1.3 :family "Inconsolata")))))

