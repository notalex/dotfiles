
;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
   (ido-mode t)
     

(setq inhibit-startup-message t)

;;putty Arrow Keys
;;

(global-set-key [M-left] 'windmove-left) ; move to left windnow
(global-set-key [M-right] 'windmove-right) ; move to right window
(global-set-key [M-up] 'windmove-up) ; move to upper window
(global-set-key [M-down] 'windmove-down) ; move to downer window

;;Color Theme select based on terminal or gui mode
;;(require 'color-theme)
;; (load "~/.emacs.d/emac_themes/color-theme-cobalt.el")
;; (color-theme-cobalt)

;;Solarized Dark Theme

;;(add-to-list 'load-path "~/.emacs.d/emac_themes/emacs-color-theme-solarized/")
;;(require 'color-theme-solarized)
;;(color-theme-solarized-dark)

;;Toggle menu bar mode from frame
(toggle-menu-bar-mode-from-frame)

;;"Undo" redo using C-c <left>/<right> also useful in switching to previous window configuration.
(when (fboundp 'winner-mode)
      (winner-mode 1))

;;Scrollbar only when window mode and toolbar.
(scroll-bar-mode -1)
(tool-bar-mode -1)

;;Set Cursor Color
(setq default-frame-alist
  '((cursor-color . "red")))

;;Enable Ruby MOde By Default
(ruby-mode)
(put 'upcase-region 'disabled nil)