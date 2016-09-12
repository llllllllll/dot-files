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
 '(haskell-font-lock-symbols nil)
 '(haskell-indent-after-keywords
   (quote
    (("where" 4 0)
     ("of" 4)
     ("do" 4)
     ("mdo" 4)
     ("rec" 4)
     ("in" 4 0)
     ("{" 4)
     "if" "then" "else" "let")))
 '(haskell-indent-thenelse 2)
 '(haskell-mode-hook (quote (turn-on-haskell-indent)) t)
 '(if window-system t)
 '(inhibit-startup-screen t)
 '(initial-scratch-message ";; Scratch Buffer
")
 '(magit-use-overlays nil)
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
 '(default ((t (:family "Droid Sans Mono" :foundry "unknown" :slant normal :weight normal :height 158 :width normal)))))

(menu-bar-mode -1)

;; fixes the background color in xterm (or not X)
(unless (eq window-system 'x)
  (custom-set-faces '(default ((t (:background "nil"))))))

;; Don't go over 80 chars in paragraphs.
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; marmalade
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" .
               "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; alt-tab expand
(global-set-key (kbd "M-<tab>") 'dabbrev-expand)
(define-key minibuffer-local-map (kbd "M-<tab>") 'dabbrev-expand)

;; Add my path to my path...
(setq exec-path (cons "~/bin" exec-path))

;; Flyspell fix
(setq flyspell-issue-welcome-flag nil)

;; backup
(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
  backup-by-copying t
  version-control t
  delete-old-versions t
  kept-new-versions 20
  kept-old-versions 5)


;; git diff in the gutter.
(require 'diff-hl)
(global-diff-hl-mode)


(defun add-to-multiple-hooks (function hooks)
  "Adds a function to all the hooks in hooks."
  (mapc (lambda (hook)
          (add-hook hook function))
        hooks))


;; flycheck
(add-to-multiple-hooks
 'flycheck-mode
 '(python-mode-hook
   lisp-mode-hook
   haskell-mode-hook
   c-mode-hook
   c++-mode-hook))

;; fci-mode.
(add-to-multiple-hooks
 'fci-mode
 '(python-mode-hook
   lisp-mode-hook
   emacs-lisp-mode-hook
   c-mode-hook
   c++-mode-hook))

(defun c++-mode-style-hook ()
  (c-set-style "stroustrup")
  (setq-default flycheck-gcc-language-standard "gnu++14"))

(add-hook 'c++-mode-hook 'c++-mode-style-hook)
(add-hook
 'c++-mode-hook
 (lambda () (setq flycheck-gcc-language-standard "gnu++17")))

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

;; Used by virtualenvwrapper.el
(setq venv-location (expand-file-name "~/.virtualenvs"))

(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(defun python-set-trace (module)
  "Inserts a set_trace() call from MODULE at point."
  (interactive
   (list
    (completing-read "module (nose): " '("pdb" "rdb" "nose" "qdb"))))
  (cond
   ((string= module "pdb")
    (insert "import pdb;pdb.set_trace()"))
   ((string= module "rdb")
    (insert "from celery.contrib import rdb;rdb.set_trace()"))
   ((string= module "qdb")
    (insert "import qdb;qdb.set_trace()"))
   ((or (string= module "nose") (string= module ""))
    (insert "from nose.tools import set_trace;set_trace()"))))

;; https://github.com/porterjamesj/virtualenvwrapper.el/blob/master
(setq-default mode-line-format (cons '(:exec venv-current-name)
                                     mode-line-format))

;; The quantopian root directory.
(setq quantopian-root
      (file-name-as-directory
       (or (getenv "QUANTO_ROOT") "~/quantopian")))


(defmacro with-window-if-exists (window-or-nil-form &rest body)
  `(let (window-or-nil-value ,window-or-nil-form)
     (if window-or-nil-value
         (with-selected-window
             ,@body)
       ,@body)))


(defun git-grep ()
  "Grep for a symbol within the git repo of the current file."
  (interactive)
  (let* ((sym (thing-at-point 'symbol))
         (regex (read-regexp "Expression" sym)))
    (require 'vc-git)
    (vc-git-grep regex  "" (vc-git-root default-directory))))

(global-set-key (kbd "C-x g") 'git-grep)


(defun kill-current-defun ()
  (interactive)
  (let* ((bounds (bounds-of-thing-at-point 'defun))
         (start (car bounds))
         (stop (cdr bounds)))
    (kill-region start stop)))


(defun shell-command-on-filename (&optional command filename)
  (interactive)
  (let ((cmd (if command command (read-string "Command: ")))
        (fname (if filename filename (buffer-file-name))))
    (shell-command (format "%s %s" cmd fname))))

(defmacro make-shell-command-for-current-file (command)
  `(defun ,command (&rest args)
     (interactive)
     (apply 'shell-command-on-filename ,(symbol-name command) args)))

(make-shell-command-for-current-file nosetests)
(make-shell-command-for-current-file py.test)

(require 'magit)
(defun git-tags ()
  "Run etags over all source files in the current git repo."
  (interactive)
  (save-window-excursion
    (let ((git-root (magit-toplevel)))
      (shell-command (format "git tags %s" git-root))
      (visit-tags-table git-root))))


(add-to-list 'load-path "~/.emacs.d/lisp")
(load "gforth.el" nil t t)
(add-to-list 'auto-mode-alist '("\\.fs$" . forth-mode))
(setq forth-indent-level 2)

(require 'multiple-cursors)
(global-set-key (kbd "C-x C-SPC") 'mc/edit-lines)
