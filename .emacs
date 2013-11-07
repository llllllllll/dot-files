(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-hook (quote haskell-mode-hook) t)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes (quote ("1ac9a474d289e6a44894d1b484b3aa5eb345cea6ed6f32ec5214c797ac7ddf23" "68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "301f218fa2357b2aa2a433e049f87e059c5ba2ad8b161634d758fbf007bf1d0a" default)))
 '(global-linum-mode t)
 '(global-rainbow-delimiters-mode t)
 '(haskell-font-lock-symbols nil)
 '(haskell-indent-after-keywords (quote (("where" 4 0) ("of" 4) ("do" 4) ("mdo" 4) ("rec" 4) ("in" 4 0) ("{" 4) "if" "then" "else" "let")))
 '(haskell-indent-thenelse 2)
 '(haskell-mode-hook (quote (turn-on-haskell-indent)))
 '(if window-system t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message ";; Scratch Buffer
")
 '(rainbow-delimiters-highlight-brackets-p nil)
 '(scheme-program-name "guile")
 '(setq inhibit-startup-message t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Droid Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "lawn green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "plum"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "CadetBlue3"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "pink"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "red")))))

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; rainbow delimeters
(global-rainbow-delimiters-mode)

;; alt-tab expand
(global-set-key (kbd "M-<tab>") 'dabbrev-expand)
(define-key minibuffer-local-map (kbd "M-<tab>") 'dabbrev-expand)


;; backup stuff
(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
  backup-by-copying t
  version-control t
  delete-old-versions t
  kept-new-versions 20
  kept-old-versions 5
  )

;; auctex stuff
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
