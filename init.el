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
   :init
   (add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
   :bind ("C-c v" . visual-line-mode)
   )
(setq-default fill-column 80)

(use-package modus-themes
:ensure t
:config
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t)
(load-theme 'modus-vivendi-tinted :no-confirm)
)
