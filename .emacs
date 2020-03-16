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
 '(package-selected-packages
   (quote
    (visual-fill-column clang-format csharp-mode flycheck-rust rust-mode flycheck-pyflakes flycheck haskell-mode yaml-mode virtualenvwrapper sml-mode multiple-cursors monokai-theme markdown-mode magit latex-preview-pane jedi flycheck-haskell fill-column-indicator diff-hl cython-mode bison-mode)))
 '(safe-local-variable-values
   (quote
    ((eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((python-include
                       (do-shell "python -c \"import sysconfig; print(sysconfig.get_path('include'))\""))
                      (numpy-include
                       (do-shell "python -c \"import numpy; print(numpy.get_include())\""))
                      (project-root
                       (do-shell "git rev-parse --show-toplevel")))
                   (append
                    (list python-include numpy-include)))))
     (eval add-to-list
           (quote auto-mode-alist)
           (quote
            ("\\.uml" . python-mode)))
     (eval add-to-list
           (quote auto-mode-alist)
           (quote
            ("\\.uml\\'" . python-mode)))
     (eval add-to-list
           (quote auto-mode-alist)
           (quote
            ("\\.h\\'" . c++-mode))
           (quote
            ("\\.uml\\'" . python-mode)))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((python-include
                       (do-shell "python -c \"import sysconfig; print(sysconfig.get_path('include'))\""))
                      (numpy-include
                       (do-shell "python -c \"import numpy; print(numpy.get_include())\""))
                      (project-root
                       (do-shell "git rev-parse --show-toplevel"))
                      (libpy-include
                       (concat project-root "/submodules/libpy/include")))
                   (append
                    (list python-include numpy-include libpy-include)))))
     (eval setq flycheck-gcc-include-path
           (let
               ((project-root
                 (substring
                  (shell-command-to-string "git rev-parse --show-toplevel")
                  0 -1)))
             (list
              (get-numpy-include)
              (get-python-include)
              (concat project-root "/abseil-cpp")
              (concat project-root "/libpy/include"))))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((project-root
                       (do-shell "git rev-parse --show-toplevel"))
                      (relative-project-subdirs
                       (quote
                        ("include")))
                      (absolute-project-subdirs
                       (mapcar
                        (lambda
                          (subdir)
                          (concat project-root "/" subdir))
                        relative-project-subdirs)))
                   (cons
                    (concat project-root "/" "submodules/abseil-cpp/")
                    absolute-project-subdirs))))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((project-root
                       (do-shell "git rev-parse --show-toplevel"))
                      (relative-project-subdirs
                       (quote
                        ("include")))
                      (absolute-project-subdirs
                       (mapcar
                        (lambda
                          (subdir)
                          (concat project-root "/" subdir))
                        relative-project-subdirs)))
                   (cons "submodules/abseil-cpp/" absolute-project-subdirs))))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((project-root
                       (do-shell "git rev-parse --show-toplevel"))
                      (relative-project-subdirs
                       (quote
                        ("include")))
                      (absolute-project-subdirs
                       (mapcar
                        (lambda
                          (subdir)
                          (concat project-root "/" subdir))
                        relative-project-subdirs)))
                   absolute-project-subdirs)))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((project-root
                       (do-shell "git rev-parse --show-toplevel"))
                      (relative-project-subdirs
                       (quote
                        ("include")))
                      (absolute-project-subdirs
                       (mapcar
                        (lambda
                          (subdir)
                          (concat project-root "/" subdir))
                        relative-project-subdirs)))
                   (absolute-project-subdirs))))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((python-include
                       (do-shell "python -c \"import sysconfig; print(sysconfig.get_path('include'))\""))
                      (numpy-include
                       (do-shell "python -c \"import numpy; print(numpy.get_include())\""))
                      (project-root
                       (do-shell "git rev-parse --show-toplevel"))
                      (libpy-include
                       (concat project-root "/submodules/libpy/include"))
                      (relative-project-subdirs
                       (quote
                        ("include")))
                      (absolute-project-subdirs
                       (mapcar
                        (lambda
                          (subdir)
                          (concat project-root "/" subdir))
                        relative-project-subdirs)))
                   (append
                    (list python-include numpy-include libpy-include)
                    absolute-project-subdirs))))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((python-include
                       (do-shell "python -c \"import sysconfig; print(sysconfig.get_path('include'))\""))
                      (project-root
                       (do-shell "git rev-parse --show-toplevel")))
                   (list python-include project-root))))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((python-include
                       (do-shell "python -c \"import sysconfig; print(sysconfig.get_path('include'))\""))
                      (project-root
                       (do-shell "git rev-parse --show-toplevel"))
                      (absolute-project-subdirs
                       (mapcar
                        (lambda
                          (subdir)
                          (concat project-root "/" subdir))
                        relative-project-subdirs)))
                   (append
                    (list python-include project-root)
                    absolute-project-subdirs))))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((python-include
                       (do-shell "python -c \"import sysconfig; print(sysconfig.get_path('include'))\""))
                      (project-root
                       (do-shell "git rev-parse --show-toplevel"))
                      (absolute-project-subdirs
                       (mapcar
                        (lambda
                          (subdir)
                          (concat project-root "/" subdir))
                        relative-project-subdirs)))
                   (append
                    (list python-include ".")
                    absolute-project-subdirs))))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((python-include
                       (do-shell "python -c \"import sysconfig; print(sysconfig.get_path('include'))\""))
                      (project-root
                       (do-shell "git rev-parse --show-toplevel"))
                      (absolute-project-subdirs
                       (mapcar
                        (lambda
                          (subdir)
                          (concat project-root "/" subdir))
                        relative-project-subdirs)))
                   (append
                    (list python-include)
                    absolute-project-subdirs))))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((python-include
                       (do-shell "python -c \"import sysconfig; print(sysconfig.get_path('include'))\""))
                      (numpy-include
                       (do-shell "python -c \"import numpy; print(numpy.get_include())\""))
                      (project-root
                       (do-shell "git rev-parse --show-toplevel"))
                      (libpy-include
                       (concat project-root "/libpy/include"))
                      (relative-project-subdirs
                       (split-string
                        (shell-command-to-string "ls -l `git rev-parse --show-toplevel` | grep '^d' | awk '{print $9}'")))
                      (absolute-project-subdirs
                       (mapcar
                        (lambda
                          (subdir)
                          (concat project-root "/" subdir))
                        relative-project-subdirs)))
                   (append
                    (list python-include numpy-include libpy-include)
                    absolute-project-subdirs))))
     (eval progn
           (c-set-offset
            (quote innamespace)
            0)
           (defun do-shell
               (s)
             (substring
              (shell-command-to-string s)
              0 -1))
           (setq flycheck-gcc-include-path
                 (let*
                     ((python-include
                       (do-shell "python -c \"import sysconfig; print(sysconfig.get_path('include'))\""))
                      (numpy-include
                       (do-shell "python -c \"import numpy; print(numpy.get_include())\""))
                      (project-root
                       (do-shell "git rev-parse --show-toplevel"))
                      (libpy-include
                       (concat project-root "/submodules/libpy/include"))
                      (relative-project-subdirs
                       (split-string
                        (shell-command-to-string "ls -l `git rev-parse --show-toplevel` | grep '^d' | awk '{print $9}'")))
                      (absolute-project-subdirs
                       (mapcar
                        (lambda
                          (subdir)
                          (concat project-root "/" subdir))
                        relative-project-subdirs)))
                   (append
                    (list python-include numpy-include libpy-include)
                    absolute-project-subdirs))))
     (eval add-to-list
           (quote auto-mode-alist)
           (quote
            ("\\.h\\'" . c++-mode)))
     (eval setq flycheck-gcc-include-path
           (let*
               ((project-root
                 (substring
                  (shell-command-to-string "git rev-parse --show-toplevel")
                  0 -1))
                (relative-project-subdirs
                 (split-string
                  (shell-command-to-string "ls -l `git rev-parse --show-toplevel` | grep '^d' | awk '{print $9}'")))
                (absolute-project-subdirs
                 (mapcar
                  (lambda
                    (subdir)
                    (concat project-root "/" subdir))
                  relative-project-subdirs)))
             (append absolute-project-subdirs
                     (list
                      (concat project-root "/submodules/libpy/include")
                      (expand-file-name "~/.virtualenvs/factset/include/python3.6m")
                      (expand-file-name "~/.virtualenvs/factset/lib/python3.6/site-packages/numpy/core/include")))))
     (eval setq flycheck-gcc-include-path
           (append
            (mapcar
             (function
              (lambda
                (x)
                (concat
                 (substring
                  (shell-command-to-string "git rev-parse --show-toplevel")
                  0 -1)
                 x)))
             (split-string
              (shell-command-to-string "ls -l `git rev-parse --show-toplevel` | grep '^d' | awk '{print \"/\" $9}'")))
            (list
             (concat
              (substring
               (shell-command-to-string "git rev-parse --show-toplevel")
               0 -1)
              "/submodules/libpy/include")
             (expand-file-name "~/.virtualenvs/factset/include/python3.6m")
             (expand-file-name "~/.virtualenvs/factset/lib/python3.6/site-packages/numpy/core/include"))))
     (eval setq flycheck-gcc-include-path
           (list "../" "../benchmark/include"))
     (eval setq flycheck-gcc-include-path
           (list "../" "../include" "../submodules/googletest/googletest/include"
                 (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")
                 "/usr/include/python3.6m"))
     (eval setq flycheck-gcc-include-path
           (append
            (split-string
             (shell-command-to-string "ls -l `git rev-parse --show-toplevel` | grep '^d' | awk '{print $9}'"))
            (list
             (concat
              (substring
               (shell-command-to-string "git rev-parse --show-toplevel")
               0 -1)
              "/submodules/libpy/include")
             (expand-file-name "~/.virtualenvs/factset/include/python3.6m")
             (expand-file-name "~/.virtualenvs/factset/lib/python3.6/site-packages/numpy/core/include"))))
     (eval setq flycheck-gcc-include-path
           (list
            (concat
             (substring
              (shell-command-to-string "git rev-parse --show-toplevel")
              0 -1)
             "/submodules/libpy/include")
            (expand-file-name "~/.virtualenvs/factset/include/python3.6m")
            (expand-file-name "~/.virtualenvs/factset/lib/python3.6/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (list
            (concat
             (substring
              (shell-command-to-string "git rev-parse --show-toplevel")
              0 -1 "/submodules/libpy/include"))
            (expand-file-name "~/.virtualenvs/factset/include/python3.6m")
            (expand-file-name "~/.virtualenvs/factset/lib/python3.6/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (list "../" "../../"
                 (concat
                  (substring
                   (shell-command-to-string "git rev-parse --show-toplevel")
                   0 -1 "/submodules/libpy/include"))
                 (expand-file-name "~/.virtualenvs/factset/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/factset/lib/python3.6/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (list "../" "../../" "../../submodules/libpy/include"
                 (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (list "../" "../include" "../../include" "../../../include" "/usr/include/python3.6m"
                 (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")
                 (expand-file-name "~/quantopian/zipline/zipline/lib/include")
                 "/home/joe/quantopian/libpy/include"))
     (eval setq flycheck-gcc-include-path
           (list "../" "../../" "../submodules/libpy/include"
                 (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (list "../" "../include" "../../include" "../../../include" "../submodules/googletest/googletest/include"
                 (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")
                 "/usr/include/python3.6m"))
     (eval setq flycheck-gcc-include-path
           (list "../" "../include" "../../include" "../../../include" "/usr/include/python3.6m"
                 (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")
                 "/home/joe/quantopian/libpy/include"))
     (eval setq flycheck-gcc-include-path
           (list "../" "../include" "../../include" "../../../include"
                 (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")
                 "/usr/include/python3.6m"))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "../../../include"
             (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
             (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")
             "/usr/include/python3.6m")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "../../../include" "/usr/include/python3.6m"
             (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
             (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")
             "/home/joe/quantopian/libpy/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "../../../include" "/usr/include/python3.6m")))
     (eval setq flycheck-gcc-include-path
           (list "../" "../../" "../submodules/factset_symbology/factset_asset_mapper/"
                 (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (list "../" "../../" "../submodules/factset_symbology/factset_asset_mapper/factset_asset_mapper/"
                 (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (list "../" "../../" "../../submodules/factset_symbology/factset_asset_mapper/factset_asset_mapper/"
                 (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "/home/joe/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include" "/usr/include/python3.6m")))
     (eval set-fill-column 80)
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "/usr/include/python3.6m")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "../../../include" "../submodules/googletest/googletest/include" "../submodules/benchmark/include" "/usr/include/python3.6m")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "../../../include" "../submodules/googletest/googletest/include" "../submodules/benchmark/src" "/usr/include/python3.6m")))
     (eval set-fill-column 90)
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "../submodules/googletest/googletest/include" "../../../include" "/usr/include/python3.6m")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "../submodules/googletest/googletest/include" "../../../include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "../../../include" "../submodules/googletest/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "../../../include")))
     (eval setq flycheck-gcc-include-path
           (list "../" "../../"
                 (expand-file-name "~/.virtualenvs/fundamentals/include/python3.6m")
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")))
     (test-case-name . twisted\.words\.test\.test_irc)
     (eval setq flycheck-gcc-include-path
           (quote
            (".." "/usr/include/python3.6m")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" ".." "/usr/include/python3.6m" "../submodules/libpy/include")))
     (c-style . "stroustrup")
     (eval setq flycheck-gcc-include-path
           (quote
            ("../../../submodules/cpython/Include" "../../../submodules/cpython")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../../../submodules/cpython/Include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../../submodules/cpython/Include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include")))
     (py-indent-offset . 2)
     (py-indent-offset . 4)
     (eval setq flycheck-gcc-include-path
           (quote
            ("/usr/include/python3.6m")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("/usr/include/python3.6")))
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python3.6m"
                 (expand-file-name "~/.virtualenvs/warp_prism/lib/python3.6/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" ".." "/usr/include/python3.6m" "../submodules/libpy/include" "../../../submodules/libpy/include/")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" ".." "/usr/include/python3.6m"
             (\, "../submodules/libpy/include")
             "../../../submodules/libpy/include/")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" ".." "/usr/include/python3.6m")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" "../" "/usr/include/python3.6m")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "/usr/include/python3.6m" "../gtest/googletest/include")))
     (eval setq flycheck-gcc-include-path
           (list "../" "../../" "/usr/include/python3.6m"
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.6/site-packages/numpy/core/include")))
     (c-file-style
      (\, "gnu"))
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python3.6m"
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.4/site-packages/numpy/core/include")))
     (eval c-set-offset
           (quote innamespace)
           4)
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python3.4m"
                 (expand-file-name "~/.virtualenvs/fundamentals/lib/python3.4/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python3.4m"
                 (expand-file "~/.virtualenvs/fundamentals/lib/python3.4/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("/usr/include/python3.4m"
             (\,
              (expand-file "~/.virtualenvs/fundamentals/lib/python3.4/site-packages/numpy/core/include")))))
     (eval setq flycheck-gcc-include-path
           (quote
            ("/usr/include/python3.4m"
             (expand-file "~/.virtualenvs/fundamentals/lib/python3.4/site-packages/numpy/core/include"))))
     (eval setq flycheck-gcc-include-path
           (quote
            ("/usr/include/python3.4m" "~/.virtualenvs/fundamentals/lib/python3.4/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("/usr/include/python4.5m" "~/.virtualenvs/fundamentals/lib/python3.4/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("/home/yui/.virtualenvs/databazaar/lib/python3.4/site-packages/numpy/core/include" "/usr/include/python3.4m")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" "../" "../include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" "..")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" "../../")))
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python3.5m"))
     (c-set-style "stroustrup")
     (eval setq flycheck-gcc-include-path
           (quote
            ("/usr/include/python3.5m")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" "../" "../include" "/usr/include/python3.5m" "../gtest/googletest/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "../../include" "/usr/include/python3.5m" "../gtest/googletest/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../../include" "/usr/include/python3.5m" "../gtest/googletest/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" "/usr/include/python3.5m" "../gtest/googletest/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" "/usr/include/python3.5m" "gtest/googletest/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../../include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../include" "/usr/include/python3.5m")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("../" "../../include" "/usr/include/python3.5m")))
     (eval c-set-offset
           (quote innamespace)
           0)
     (eval add-to-list
           (quote c-offset-alist)
           (quote
            ((quote innamespace)
             0)))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" "/usr/include/python3.5m")))
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python2.7" "qexec/utils/"
                 (shell-command-to-string "echo -n $WORKON_HOME/qexec/lib/python2.7/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python2.7" "qexec/utils/"
                 (shell-command-to-string "echo $WORKON_HOME/qexec/lib/python2.7/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python2.7" "qexec/utils/"
                 (shell-command-to-string "python -c 'import numpy as np;print(np.get_include())'")))
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python2.7" "qexec/utils/"
                 (shell-command-to-string "python -c 'import numpy as np;print np.get_include()'")))
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python2.7" "qexec/utils/"
                 (shell-command-to-string "./etc/npinclude")))
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python2.7" "qexec/utils/"
                 (shell-command-to-string "etc/npinclude")))
     (eval setq flycheck-gcc-include-path
           (list "/usr/include/python2.7" "qexec/utils/"
                 (read-shell-command "etc/npinclude")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("/usr/include/python2.7" "qexec/utils/"
             (read-shell-command "etc/npinclude"))))
     (eval setq flycheck-gcc-include-path
           (quote
            ("/usr/include/python2.7" "qexec/utils/"
             (\,
              (read-shell-command "etc/npinclude")))))
     (eval setq flycheck-gcc-include-path
           (quote
            ("/usr/include/python2.7" "qexec/utils/" "/home/yui/.virtualenvs/qexec/lib/python2.7/site-packages/numpy/core/include")))
     (eval setq flycheck-gcc-include-path
           (quote
            ("include" "../"))))))
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

(setq browse-url-browser-function 'browse-url-firefox)

;; Don't go over 80 chars in paragraphs.
(setq-default fill-column 80)
; (add-hook 'text-mode-hook 'turn-on-auto-fill)

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

(setq-default flycheck-disabled-checkers '(c/c++-clang))
(setq flycheck-check-syntax-automatically '(save))

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
  (setq-default flycheck-gcc-language-standard "gnu++17")
  (c-set-offset 'innamespace 0)
  (setq font-lock-maximum-decoration 2))

(add-hook 'c++-mode-hook 'c++-mode-style-hook)

;; theme
(load-theme 'monokai t)
;;(load-theme 'adwaita t)

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
(setq whitespace-style '(face empty trailing))
(global-whitespace-mode t)

(setq sentence-end-double-space nil)

(defun ospl/unfill-paragraph ()
  "Unfill the paragraph at point."
  (let ((fill-column (point-max)))
    (fill-paragraph)))

(defun ospl/fill-paragraph ()
  "Fill the current paragraph until there is one sentence per line.
This unfills the paragraph, and places hard line breaks after each sentence."
  (interactive)
  (save-excursion
    (fill-paragraph)
    (ospl/unfill-paragraph)  ; remove hard line breaks
    (beginning-of-line)

    ;; insert line breaks again
    (let ((end-of-paragraph (make-marker))
	  (fill-column (point-max)))
      (set-marker end-of-paragraph (line-end-position))
      (forward-sentence)
      (while (< (point) end-of-paragraph)
        (just-one-space)
        (delete-backward-char 1)
        (newline)
        (forward-sentence))
      (set-marker end-of-paragraph nil))))

(require 'visual-fill-column)

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook (lambda () (local-set-key (kbd "M-q") 'ospl/fill-paragraph)))
(add-hook 'markdown-mode-hook 'visual-fill-column-mode)
(add-hook 'markdown-mode-hook (lambda () (set-fill-column 90)))
(add-hook 'rst-mode-hook (lambda () (local-set-key (kbd "M-q") 'ospl/fill-paragraph)))
(add-hook 'rst-mode-hook 'visual-fill-column-mode)
(add-hook 'rst-mode-hook (lambda () (set-fill-column 90)))

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

(defun c-set-break ()
  "Inserts an interrupt instruction for setting a gdb break point."
  (interactive)
  (insert "__asm__(\"int $3\");"))

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

(require 'multiple-cursors)
(global-set-key (kbd "C-x C-SPC") 'mc/edit-lines)

(defun insert-date (format)
  "Insert the current date into the buffer at the point."
  (interactive "sformat (%%Y-%%m-%%d): ")
  (insert (format-time-string
           (if (string= format "")
               "%Y-%m-%d"
             format))))


(setq erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-lurker-threshold-time 3600)

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(add-hook 'python-mode-hook (lambda () (setq fill-column 79)))

(require 'clang-format)

(defun format-c++ (&optional arg)
  (interactive "*P")
  (c-fill-paragraph arg)
  (call-interactively 'clang-format))

(add-hook 'c++-mode-hook (lambda () (local-set-key (kbd "M-q") 'format-c++)))


(defun indent-after-comma()
  (interactive)
  (re-search-forward ",[ ]*" (line-end-position) t)
  (replace-match ",")
  (newline-and-indent))

(global-set-key (kbd "C-x n") 'indent-after-comma)


(defun git-grep ()
  "Grep for a symbol within the git repo of the current file."
  (interactive)
  (let* ((sym (thing-at-point 'symbol))
         (regex (read-regexp "Expression" sym)))
    (require 'vc-git)
    (vc-git-grep regex  "" (vc-git-root default-directory))))

(define-key magit-file-mode-map (kbd "C-x g") nil)
(global-set-key (kbd "C-x g") 'git-grep)

(defcustom smart-to-ascii-map '(("\x201C" . "\"")
                ("\x201D" . "\"")
                ("\x2018" . "'")
                            ("\x2019" . "'")
                            ;; en-dash
                            ("\x2013" . "-")
                            ;; em-dash
                            ("\x2014" . "-"))
  ""
  :type '(repeat (cons (string :tag "Smart Character  ")
                       (string :tag "Ascii Replacement"))))

(defun smart-to-ascii (beg end)
  (interactive "r")
  (format-replace-strings smart-to-ascii-map
                          nil beg end))
