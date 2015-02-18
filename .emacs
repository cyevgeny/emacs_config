;set load path (for windows)
(add-to-list 'load-path "c:/Users/nax/AppData/Roaming/.emacs.d/lisp" ) 

;;set key bindings for navigation and show lineumbers
(global-linum-mode t)
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-i") 'previous-line)
(global-set-key (kbd "C-;") 'kill-whole-line)

;(global-set-key (kbd "<tab>") 'tab-to-tab-stop)
(global-set-key (kbd "C-c b") 'kill-this-buffer)
(global-set-key (kbd "C-c x") 'kill-emacs)
(global-set-key (kbd "<f11>") 'dired)

;;set keys for navigation between windows
(global-set-key (kbd "C-c i") 'windmove-up)
(global-set-key (kbd "C-c k") 'windmove-down)
(global-set-key (kbd "C-c j") 'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)

;;some bindings from ErgoEmacs
(subword-mode +1)
(global-set-key (kbd "M-e") 'subword-backward-kill)
(global-set-key (kbd "M-r") 'subword-kill)
(global-set-key (kbd "M-u") 'subword-backward)
(global-set-key (kbd "M-o") 'subword-forward)
(global-set-key (kbd "C-k") 'scroll-up-command)
(global-set-key (kbd "C-i") 'scroll-down-command)
(global-set-key (kbd "M-f") 'delete-char)
(global-set-key (kbd "M-d") 'delete-backward-char)
(global-set-key (kbd "C-l") 'forward-sexp)
(global-set-key (kbd "C-j") 'backward-sexp)
(global-set-key (kbd "M-m") 'next-buffer)
(global-set-key (kbd "M-n") 'previous-buffer)
(global-set-key (kbd "M-;") 'delete-window)
(global-set-key (kbd "M-1") 'split-window-below)
(global-set-key (kbd "M-2") 'split-window-right)
(global-set-key (kbd "<backspace>") 'ignore)
(global-set-key (kbd "M-c") 'newline)
(global-set-key (kbd "C-o") 'forward-paragraph)
(global-set-key (kbd "C-u") 'backward-paragraph)
(global-set-key (kbd "M-g") 'beginning-of-visual-line)
(global-set-key (kbd "M-h") 'end-of-visual-line);
;;(global-set-key (kbd "M-h") 'end-of-visual-line)
;;(global-set-key (kbd "C-h") 'beginning-of-visual-line)

;;set language toggle to M-Shift-j keys
(require 'zen-funcs)
(global-set-key (kbd "M-J")  'change-lang)

;;select text in brackets
(global-set-key (kbd "M-F") 'select-in-parents) 

;;(global-set-key (kbd "<return>") 'ignore)
;;autocomplete
   ;; (add-to-list 'load-path "~/.emacs.d")    ; This may not be appeared if you have already added.
    (require 'auto-complete-config)
    (add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
    (ac-config-default)


;;autoclose brackets
;;(electric-pair-mode 1)


;;Don't create *Messages* buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;;Project manager
(require 'sr-speedbar)
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)

;;save buffer to F2
(global-set-key (kbd "<f2>") 'save-buffer)

;;for scrolling
;;(setq scroll-conservatively 50)
;;(setq scroll-margin 4)
                             
;;disable toolbar and menu
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq make-backup-files         nil) ; Don't want any backup files
(setq auto-save-list-file-name  nil) ; Don't want any .saves files
(setq auto-save-default         nil) ; Don't want any auto saving

;;Use spaces instead tabs
(setq-default indent-tabs-mode nil)

;;turn on ido mode( better "file - open" menu)
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;for opening remote files via ssh
(require 'tramp)
(setq tramp-default-method "plink")
(set-default 'tramp-auto-save-directory "C:/Users/nax/AppData/Local/Temp")

;;highlight brackets
(show-paren-mode 1)

;;enable whitespace-mode
(global-set-key (kbd "<f1>") 'global-whitespace-mode)

;;(electric-indent-mode 1)
;;enable visual-line-mode
(global-visual-line-mode 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t ( :slant normal :weight normal :height 130 :width normal :foundry "outline" :family "Courier New")))))

;; Options -> Set default font
(add-to-list 'default-frame-alist '(font . "Consolas-12"))
(set-default-font "Consolas-12")

;;set width of tab
(setq tab-stop-list (number-sequence 4 30 4))

(put 'dired-find-alternate-file 'disabled nil)

;;Set abbreviation mode always on
(setq default-abbrev-mode t)

;; Tell emacs where to read abbrev
;; devinitions from
(setq abbrev-file-name 
        "~/.emacs.d/abbrev_defs")    







