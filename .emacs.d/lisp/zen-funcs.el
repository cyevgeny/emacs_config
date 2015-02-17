;;change input method. Also, change
;; cursor color for different input methods.
;;(cyan - for "russian-computer", black - otherway.
(defun change-lang()
  (interactive)
  (if current-input-method 
      (set-cursor-color "Black")
      (set-cursor-color "Cyan"))
  (setq default-input-method "russian-computer")
  (toggle-input-method)
  )

;;select text between parenthis brackets, exlude brackets
(defun select-in-parents()
  (interactive)
    (backward-up-list)
    (mark-sexp)
    (let ((new-start nil)
      (new-end nil))
      (setq new-end (- (mark) 1))
      (setq new-start (+ (point) 1))
      (goto-char new-start)
      (set-mark-command nil)
      (goto-char new-end)
    )
)

(provide 'zen-funcs)





