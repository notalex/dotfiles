;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
   (ido-mode t)

(setq inhibit-startup-message t)

;; Toggle menu bar mode from frame
(toggle-menu-bar-mode-from-frame -1)

;; Enable evil mode By Default
(add-to-list 'load-path "~/.emacs.d/elpa/evil-1.0.7")
(require 'evil)
(evil-mode 1)

(put 'upcase-region 'disabled nil)

;; package lists
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; functions
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

;; set
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; bindings
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-u" 'backward-kill-line)
(global-set-key "\C-w" 'backward-kill-word)
