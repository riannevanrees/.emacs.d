;;; Code:

;; Don't start every (previously installed) package right away.
(setq package-enable-at-startup nil)
;; Use the standard melpa archive, too.
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;; Download package info when it didn't happen yet.
(when (not package-archive-contents)
  (package-refresh-contents))

;; Install Julia mode
(package-install 'julia-mode)
(require 'julia-mode)

;; Matlab mode
;; associate .m file with the matlab-mode (major mode)
;; (require 'matlab-load)
;; (add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))
;; (add-to-list 'mlint-programs "/Applications/MatlabR2023b.app/bin/maca64/mlint")

;; better-defaults is the set of nicer settings that previously was
;; part of the "emacs starter kit".
(use-package better-defaults
  :ensure t
  :init
  ; first start fido, otherwise ido already gets started.
  (fido-vertical-mode)
  )

;; Start the server so I can use emacsclient.
(use-package server
  :if window-system
  :init
  (server-start)
  ;; Maximize screen when starting up.
  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  )

;; Theme settings. I kinda like this dark theme (there's a white
;; version, too, btw).
(use-package modus-themes
  :ensure t
  :config
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t)
  (load-theme 'modus-vivendi-tinted :no-confirm)
  )

;; Handy for visually wrapping lines on the fill column instead of at
;; the end of the screen in case a colleague has written a readme with
;; really long lines. I've configured visual-line-mode as "ctrl-c v".
(use-package visual-fill-column
  :ensure t
  :config
  (add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
  :bind ("C-c v" . visual-line-mode)
  )

;; Show available key bindings.
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  )

;; Really nice and powerful git integration.
(use-package magit
  :ensure t
  :bind ("C-c g" . magit-status)
  )

;; Generic emacs configuration.
(use-package emacs
  :init

  ;; Stop ringing the bell
  (setq ring-bell-function 'ignore)

  ;; Change yes/no questions to y/n
  (setq use-short-answers t)

  ;; Don't let minified javascript (with its super-long lines) bring
  ;; emacs to a grinding halt.
  (global-so-long-mode t)

  ;; Set fill column to 88 instead of 70.
  (setq-default fill-column 88)

  ;; Save the "alt-x" history.
  (savehist-mode 1)

  ;; Don't accidentally exit emacs. Note: this means you have to
  ;; manually exit emacs when doing a mac OS update.
  (setq confirm-kill-emacs 'yes-or-no-p)

  ;; Indent with spaces instead of tabs by default. Normally the major
  ;; mode sets it, but I've been bitten by tabs in some rare
  ;; cases. Makefile-mode correctly uses tabs, which is the only place
  ;; where I need them.
  (setq-default indent-tabs-mode nil)

  ;; Auto revert mode: automatically reload the buffer when the
  ;; underlying file changes (for instance because you ran 'black' over
  ;; some files. Also keep the directory listings up-to-date.
  (global-auto-revert-mode 1)
  (add-hook 'dired-mode-hook 'auto-revert-mode)

  ;; When regularly editing, show the current line lightly highlighted.
  (add-hook 'prog-mode-hook #'hl-line-mode)
  (add-hook 'text-mode-hook #'hl-line-mode)

  ;; Zap trailing whitespace.
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;; When running output is printed in some buffer, just follow along
  ;; (until the first error).
  (setq compilation-scroll-output 'first-error)

  ;; Place the something~ backup files in the temp dir.
  (setq backup-directory-alist
            `((".*" . ,temporary-file-directory)))


  :bind (("C-c s" . sort-lines)
         )
  )

;; c-x k now directly kills the *current* buffer instead of asking you for the
;; name of a buffer to kill
;; See http://pragmaticemacs.com/emacs/dont-kill-buffer-kill-this-buffer-instead/
(defun bjm/kill-this-buffer ()
  "Kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'bjm/kill-this-buffer)


;; Have customize write its stuff to a separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file 'noerror))

(provide 'init.el)
;;; init.el ends here
