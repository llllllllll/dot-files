(custom-set-variables
 '(add-hook (quote haskell-mode-hook) t)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes (quote ("68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "301f218fa2357b2aa2a433e049f87e059c5ba2ad8b161634d758fbf007bf1d0a" default)))
 '(global-linum-mode t)
 '(haskell-font-lock-symbols nil)
 '(haskell-indent-after-keywords (quote (("where" 4 0) ("of" 4) ("do" 4) ("mdo" 4) ("rec" 4) ("in" 4 0) ("{" 4) "if" "then" "else" "let")))
 '(haskell-indent-thenelse 2)
 '(haskell-mode-hook (quote (turn-on-haskell-indent)))
 '(if window-system t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message ";; Scratch Buffer")
 '(setq inhibit-startup-message t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 '(default ((t (:family "Droid Sans Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)
(global-rainbow-delimiters-mode)
(global-set-key (kbd "M-<tab>") 'dabbrev-expand)
(define-key minibuffer-local-map (kbd "M-<tab>") 'dabbrev-expand)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
  backup-by-copying t
  version-control t
  delete-old-versions t
  kept-new-versions 20
  kept-old-versions 5
  )
