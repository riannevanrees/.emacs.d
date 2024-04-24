;; Riannes emacs configuration.
;; This file is exported from emacs.org.
;; URL: https://github.com/riannevanrees/.emacs.d

(use-package package
  :config
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  (package-initialize))

(setq load-prefer-newer t)
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(setq-default custom-file
	      (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(use-package olivetti
  :hook (text-mode prog-mode org-agenda-mode)
  :custom
  (olivetti-body-width 0.5)
  (olivetti-minimum-body-width 50)
  (olivetti-margin-width 7)
  (olivetti-style 'fancy))

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  )

(use-package visual-fill-column
   :ensure t
   :bind ("C-c v" . visual-line-mode))
(setq-default fill-column 80)

(setq use-short-answers t) ;; When emacs asks for "yes" or "no", let "y" or "n" suffice

(setq-default line-spacing 1)

(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t)))

(use-package autothemer
:ensure t)

(use-package mixed-pitch
:hook
;; If you want it in all text modes:
(text-mode . mixed-pitch-mode))

(load-theme 'sleeping-beauty t)

(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "CANCELLED")
	(sequence "LEZEN" "VERZETTELEN" "|" "VOLTOOID" "GEANNULEERD")
	(sequence "LES" "VERZETTELEN" "|" "VOLTOOID" "GEANNULEERD")
	(sequence "WACHTEN" "|" "VOLTOOID" "GEANNULEERD")
	(sequence "SCHRIJVEN" "HERSCHRIJVEN" "|" "GESCHREVEN")))

(setq org-fontify-todo-headline t)

(use-package org-superstar
  ;:hook (org-mode . (lambda () (org-superstar-mode 1)))
  :custom
  (org-superstar-leading-bullet " ")
  (org-superstar-remove-leading-stars t)
  (org-superstar-todo-bullet-alist '(("TODO" . 9744)
				     ("LES" . 9744)
				     ("LEZEN" . 9744)
				     ("VERZETTELEN" . 9744)
				     ("DONE" . 9745)
				     ("VOLTOOID" 9745))))

(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-agenda-span 1
      org-agenda-start-day "+0d"
      org-agenda-skip-timestamp-if-done t
      org-agenda-skip-scheduled-if-deadline-is-shown t
      org-deadline-warning-days 7)

(setq org-agenda-prefix-format '(
      (agenda . "%-12c%-12b ")
      ;(agenda . "%-15b ")
      ))

(setq org-agenda-breadcrumbs-seperator "")

(setq org-agenda-custom-commands
      '(("v" "Agenda, zettelkasten en prioriteiten"
	 ((agenda ""
		  ((org-agenda-overriding-header "Agenda")))
	  (tags-todo "TODO=\"VERZETTELEN\""))
	 )))

(use-package org-super-agenda
  :custom org-super-agenda-groups
  '(
    (:name "Over datum"
	   :deadline past
	   :order 1
	   :face 'error)
    (:name "Vandaag"
	   :time-grid t
	   :date today
	   :scheduled today
	   :scheduled past
	   :deadline today
	   :order 1)
    (:name "Deadlines"
	   :deadline future
	   :order 2)
    (:name "Belangrijk"
	   :priority "A"
	   :order 2)
    ))

(setq org-blank-before-new-entry '((heading . t) (plain-list-item . auto)))

(use-package vterm
:ensure t)

(use-package julia-snail
  :ensure t
  :hook (julia-mode . julia-snail-mode))

(use-package julia-formatter
  :hook julia-mode)

(require 'conda)

;; exec-path-from-shell ensures the $PATH is set just like in your
;; terminal. This helps finding pipx-installed tools when starting
;; emacs from your OS
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :config
  (exec-path-from-shell-initialize)
  )

(use-package python
:config
(setq python-check-command "ruff")
(add-hook 'python-base-mode-hook 'eglot-ensure)
)

(use-package flymake)
