(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-u" 'backward-kill-line)
(global-set-key "\C-w" 'backward-kill-word)

(define-key helm-map (kbd "\C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "\C-h") 'delete-backward-char)
