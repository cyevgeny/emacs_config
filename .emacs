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
(global-set-key (kbd "M-g") 'beginning-of-visual-line)
(global-set-key (kbd "M-h") 'end-of-visual-line)

;; One func that I often use from html-mode
(global-set-key (kbd "M-3") 'html-href-anchor)

(require 'monokai-theme);
(setq monokai-theme-is-global t)

(require 'zen-funcs)

;; insert current date
(global-set-key (kbd "M-b") 'insert-date)

(global-set-key (kbd "C-c p") 'zen-mark-paragraph)
(global-set-key (kbd "C-o") 'zen-forward-paragraph)
(global-set-key (kbd "C-u") 'zen-backward-paragraph)

(global-set-key (kbd "M-D") 'zen-copy-line)

;;set language toggle to M-Shift-j keys
(global-set-key (kbd "M-J")  'change-lang)

;;select text in brackets
(global-set-key (kbd "M-F") 'select-in-parents) 

;;wrap img filename in <img> tag
(global-set-key (kbd "<f5>") 'wrap-img-tag)

;;insert template from file
(global-set-key (kbd "<f3>") 'zen-find-file-insert)

;;insert <article> ... </article> tags
(global-set-key (kbd "<f6>") 'zen-insert-tag)


;;Update title and h1 on the html page
(global-set-key (kbd "C-c t") 'xhm-update-title)

;;set width of offset for JavaScript code
(setq js-indent-level 2)


(require 'another-mode)
(global-set-key (kbd "M-4") 'xhm-lines-to-html-list)

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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("a1493957ee779057acdc4c337133f217dd7b2edfdeeffed903ba2f16246f665a" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:slant normal :weight normal :height 130 :width normal :foundry "outline" :family "Courier New")))))

;; Options -> Set default font
(add-to-list 'default-frame-alist '(font . "Consolas-12"))
(set-default-font "Consolas-12")

;;set width of tab
(setq tab-stop-list (number-sequence 4 30 4))

(put 'dired-find-alternate-file 'disabled nil)

;;Set abbreviation mode always on
;(setq default-abbrev-mode t)

;; Tell emacs where to read abbrev
;; devinitions from
(setq abbrev-file-name 
        "~/.emacs.d/abbrev_defs")    


;;customize status bar
;; use setq-default to set it for /all/ modes
;;this part is from "http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html"
(setq-default  mode-line-format
  (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize "%b " 'face 'font-lock-keyword-face
        'help-echo (buffer-file-name)))

    ;; relative position, size of file
    "["
    (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
    "/"
    (propertize "%I" 'face 'font-lock-constant-face) ;; size
    "] "

    ;; the current major mode for the buffer.
    "["

    '(:eval (propertize "%m" 'face 'font-lock-string-face
              'help-echo buffer-file-coding-system))
    "] "


    "[" ;; insert vs overwrite mode, input-method in a tooltip
    '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
              'face 'font-lock-preprocessor-face
              'help-echo (concat "Buffer is in "
                           (if overwrite-mode "overwrite" "insert") " mode")))

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat ","  (propertize "Mod"
                             'face 'font-lock-warning-face
                             'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
              (concat ","  (propertize "RO"
                             'face 'font-lock-type-face
                             'help-echo "Buffer is read-only"))))  
    "] "

    ;; add the time, with the date and the emacs uptime in the tooltip
    '(:eval (propertize (format-time-string "%H:%M")
              'help-echo
              (concat (format-time-string "%c; ")
                      (emacs-uptime "Uptime:%hh"))))
    " --"
    ;; i don't want to see minor-modes; but if you want, uncomment this:
    minor-mode-alist  ;; list of minor modes
    "%-" ;; fill with '-'
    ))



