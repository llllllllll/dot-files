;; Joe Jevnik
;; My .emacs configuration file.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(add-hook (quote haskell-mode-hook) t)
 '(column-number-mode t)
 '(font-use-system-font t)
 '(global-linum-mode t)
 '(global-rainbow-delimiters-mode t)
 '(haskell-font-lock-symbols nil)
 '(haskell-indent-after-keywords (quote (("where" 4 0) ("of" 4) ("do" 4) ("mdo" 4) ("rec" 4) ("in" 4 0) ("{" 4) "if" "then" "else" "let")))
 '(haskell-indent-thenelse 2)
 '(haskell-mode-hook (quote (turn-on-haskell-indent)) t)
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.9)
 '(if window-system t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message ";; Scratch Buffer
")
 '(rainbow-delimiters-highlight-brackets-p t)
 '(scheme-program-name "guile")
 '(setq inhibit-startup-message t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(when window-system t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Droid Sans Mono" :foundry "unknown" :slant normal :weight normal :height 151 :width normal))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "lawn green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "plum"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "CadetBlue3"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "pink"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "red")))))

;; fixes the background color in xterm (or not X)
(unless (eq window-system 'x)
  (custom-set-faces '(default ((t (:background "nil"))))))

;; Don't go over 80 chars in paragraphs.
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; custom modules.
(add-to-list 'load-path "~/.emacs.d")

;; marmalade
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" .
               "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; rainbow delimeters
(global-rainbow-delimiters-mode)

;; alt-tab expand
(global-set-key (kbd "M-<tab>") 'dabbrev-expand)
(define-key minibuffer-local-map (kbd "M-<tab>") 'dabbrev-expand)

;; Add my path to my path...
(setq exec-path (cons "~/bin" exec-path))

(require 'flymake)
(defun flymake-Haskell-init ()
  (flymake-simple-make-init-impl
   'flymake-create-temp-with-folder-structure nil nil
   (file-name-nondirectory buffer-file-name)
   'flymake-get-Haskell-cmdline))
(defun flymake-get-Haskell-cmdline (source base-dir)
  (list "flycheck_haskell.pl"
        (list source base-dir)))

(push '(".+\\.hs$" flymake-Haskell-init flymake-simple-java-cleanup)
      flymake-allowed-file-name-masks)
(push '(".+\\.lhs$" flymake-Haskell-init flymake-simple-java-cleanup)
      flymake-allowed-file-name-masks)
(push
 '("^\\(\.+\.hs\\|\.lhs\\):\\([0-9]+\\):\\([0-9]+\\):\\(.+\\)"
   1 2 3 4) flymake-err-line-patterns)
(add-hook
 'haskell-mode-hook
 '(lambda ()
    (if (not (null buffer-file-name)) (flymake-mode))))


;; flyspell fix
(setq flyspell-issue-welcome-flag nil)

;; backup
(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
  backup-by-copying t
  version-control t
  delete-old-versions t
  kept-new-versions 20
  kept-old-versions 5
  )


;; theme
(load-theme 'monokai t)

;; auctex
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; 80 char limit
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)

;; Adding gmp man pages into my info-look.
(eval-after-load "info-look"
  '(let ((mode-value (assoc 'c-mode (assoc 'symbol info-lookup-alist))))
     (setcar (nthcdr 3 mode-value)
             (cons '("(gmp)Function Index" nil "^ -.* " "\\>")
                   (nth 3 mode-value)))))

;; Mutt support.
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))

;; squash those disgusting tabs!
(setq-default indent-tabs-mode nil)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;; Python:
(require 'flymake)
(setq temporary-file-directory "~/.emacs.d/tmp/")  ;; Get rid of the tmp files.
(setq flymake-max-parallel-syntax-checks nil)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list (executable-find "flake8") (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)





;; Root directory for Quantopian projects.
(setq venv-location "~/.virtualenvs")


;; https://github.com/porterjamesj/virtualenvwrapper.el/blob/master
(setq-default mode-line-format (cons '(:exec venv-current-name)
                                     mode-line-format))


(setq quantopian-root
      (let (temp)
        (setq temp (getenv "QUANTO_ROOT"))
        (if temp (file-name-as-directory temp) "~/quantopian")))

(defun qtags ()
  "Run etags on Quantopian python source file."
  (interactive)
  (shell-command
   (format
    "find %s -and -and -name '*.py' -not -name '*\.pyc' -not -name '*__init__.py' | xargs etags -o %s"
    quantopian-root (concat quantopian-root "TAGS"))))

(defun qgrep ()
  "Grep for regex in python files within the value specified for"
  "quantopian-root. Uses grep-find for built-in history."
  (interactive)
  (let (sym regex grep-fmt grep-flags)
    ;; Interactively get a regex to search for, using the symbol under the
    ;; point as a default.
    (setq sym (thing-at-point 'symbol))
    (setq regex (read-regexp "Expression" sym))
    (setq grep-flags "-nH")
    (setq grep-fmt "find %s -type f '(' -name \"*.py\" -or -name \"*.sh\" ')' \
-and -not -name \"*.pyc\" -exec grep %s --color=auto -e \"%s\" {} +")
    ;; Grep for the specified regex in .py and .sh files within quantopian-root.
    (grep-find (format grep-fmt quantopian-root grep-flags regex))))

(defun iqgrep ()
  "Grep for regex in python files within the value specified for"
  "quantopian-root. Uses grep-find for built-in history."
  (interactive)
  (let (sym regex grep-fmt grep-flags)
    ;; Interactively get a regex to search for, using the symbol under the
    ;; point as a default.
    (setq sym (thing-at-point 'symbol))
    (setq regex (read-regexp "Expression" sym))
    (setq grep-flags "-niH")
    (setq grep-fmt "find %s -type f '(' -name \"*.py\" -or -name \"*.sh\" ')' \
-and -not -name \"*.pyc\" -exec grep %s --color=auto -e \"%s\" {} +")
    ;; Grep for the specified regex in .py and .sh files within quantopian-root.
    (grep-find (format grep-fmt quantopian-root grep-flags regex))))
