;;; emacs --- Skyler Berg's personal emacs settings
;;; Commentary:
;;;   Why does flycheck hate me?

;;; Code:

(require 'package)
(package-initialize)

; repositories
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(unless package-archive-contents
    (package-refresh-contents))

(defun ensure-package-installed (package)
  (unless (package-installed-p package)
    (package-install package)
  )
)

(defun ensure-packages-installed (&rest packages)
  ;"Assure every package is installed, ask for installation if it’s not.
;Return a list of installed packages or nil for every skipped package."
  (mapcar
    'ensure-package-installed
    packages
  )
)

(ensure-packages-installed 
  'evil
  'key-chord
  'auto-complete
  'flycheck
  'color-theme-sanityinc-solarized
  'multi-term)

(package-initialize)


(evil-mode 1)

(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

(load-theme 'sanityinc-solarized-dark t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(global-linum-mode 1)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(global-set-key [(control x) (k)] 'kill-this-buffer)

(setq-default js-indent-level 2)
(setq-default c-indent-level 4)

(add-hook 'after-init-hook #'global-flycheck-mode)

(column-number-mode)

(auto-complete-mode 1)
 
(flycheck-mode 1)

(global-set-key [f8] 'neotree-toggle)

(add-hook 'neotree-mode-hook
  (lambda ()
    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; change mode-line color by evil state
(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
    (lambda ()
      (let ((color (cond ((minibufferp) default-color)
                         ((evil-insert-state-p) '("#006600" . "#ffffff"))
                         ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                         ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                         (t default-color))))
        (set-face-background 'mode-line (car color))
        (set-face-foreground 'mode-line (cdr color))))))

(setq multi-term-program "/bin/bash")

(evil-ex-define-cmd "diff" 'diff-buffer-with-file)

(diff-buffer-with-file (current-buffer))

;;; .emacs ends here
