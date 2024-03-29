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
   :hook (visual-line-mode global-visual-fill-column-mode org-mode)
   :bind ("C-c v" . visual-line-mode))
(setq-default fill-column 80)
(setq-default visual-fill-column-center-text t)
(global-visual-fill-column-mode)

(setq use-short-answers t) ;; When emacs asks for "yes" or "no", let "y" or "n" suffice

(setq-default line-spacing 1)

(setq backup-directory-alist
	  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t)))

(setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "CANCELLED")
	(sequence "LEZEN" "VERZETTELEN" "|" "VOLTOOID" "GEANNUELEERD")
	(sequence "LES" "VERZETTELEN" "|" "VOLTOOID" "GEANNULEERD")
	(sequence "WACHTEN" "|" "VOLTOOID" "GEANNULEERD")))

(use-package org-superstar
  :hook org-mode
  :custom
  (org-superstar-leading-bullet " ")
  (org-superstar-remove-leading-stars t)
  (org-superstar-todo-bullet-alist '(("TODO" . 9744)
				     ("LES" . 9744)
				     ("LEZEN" . 9744)
				     ("VERZETTELEN" . 9744)
				     ("DONE" . 9745)
				     ("VOLTOOID" 9745))))

(setq org-deadline-warning-days 7)

(use-package org-appear
  :commands (org-appear-mode)
  :hook (org-mode . org-appear-mode)
  :init
  (setq org-hide-emphasis-markers t		;; A default setting that needs to be t for org-appear
      org-appear-autoemphasis t		;; Enable org-appear on emphasis (bold, italics, etc)
      org-appear-autolinks nil		;; Don't enable on links
      org-appear-autosubmarkers t))	;; Enable on subscript and superscript
