;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

;; Appearance
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(setq-default display-line-numbers-type t)
(global-display-line-numbers-mode 1)
(column-number-mode 1)

;; Editing
(global-set-key (kbd "C-l") #'goto-line)
(setq-default indent-tabs-mode nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(global-set-key (kbd "C-x w") #'kill-region)

;; Completion and file finding
(fido-vertical-mode 1)

;; Project navigation
(global-set-key (kbd "C-c p f") #'project-find-file)

;; Languages
(require 'treesit)

(setq major-mode-remap-alist
      '((go-mode . go-ts-mode)
        (rust-mode . rust-ts-mode)))

;; M-x treesit-install-language-grammar RET go RET
;; M-x treesit-install-language-grammar RET rust RET
;; go install golang.org/x/tools/gopls@latest
;; rustup component add rust-analyzer

(setq treesit-language-source-alist
      '((go . ("https://github.com/tree-sitter/tree-sitter-go"
               "v0.23.4"))
        (rust . ("https://github.com/tree-sitter/tree-sitter-rust"
                 "v0.23.3"))))

(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))

(setq auto-mode-alist
      (append '(("\\.pl\\'" . cperl-mode)
                ("\\.pm\\'" . cperl-mode))
              auto-mode-alist))

(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))

;; LSP support (available on demand)
;; M-x eglot

;;; init.el ends here
