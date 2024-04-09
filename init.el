;; Riannes emacs configuration.
;; This file is exported from emacs.org.
;; URL: https://github.com/riannevanrees/.emacs.d

(use-package package
  :config
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  (package-initialize))

(setq-default custom-file
	      (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  )

(use-package visual-fill-column
   :ensure t
   :bind ("C-c v" . visual-line-mode))
(setq-default fill-column 80)
(setq-default visual-fill-column-center-text t)
(global-visual-fill-column-mode)

(use-package visual-line-mode
  :hook (text-mode prog-mode))

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
	(sequence "LEZEN" "VERZETTELEN" "|" "VOLTOOID" "GEANNUELEERD")
	(sequence "LES" "VERZETTELEN" "|" "VOLTOOID" "GEANNULEERD")
	(sequence "WACHTEN" "|" "VOLTOOID" "GEANNULEERD")))

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

(setq org-deadline-warning-days 7)

(setq org-blank-before-new-entry '((heading . t) (plain-list-item . auto)))
