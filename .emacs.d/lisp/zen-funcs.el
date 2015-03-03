
;;change input method. Also, change
;; cursor color for different input methods.
;;(cyan - for "russian-computer", black - oterway.
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

;;wrap image filename in <img> tag and interacrively ask for attributes
(defun wrap-img-tag()
  (interactive)
  (let (result img-filename img-alt img-id img-class img-filename-boundaries list-classes)
        (setq list-classes (list "art-img-full" "art-img"))
        (setq img-filename (thing-at-point 'filename))
        (setq img-filename-boundaries (bounds-of-thing-at-point 'filename))
        (setq img-alt (read-from-minibuffer "Enter alt for img:"))
        (setq img-id  (read-from-minibuffer "Enter id for img:"))
        (setq img-class (read-from-minibuffer "Enter class for img:" list-classes ))
    (setq result (concat "<img src=\"" img-filename "\" "))
    (if (not (equal img-id ""))
        (setq result (concat result "id=\"" img-id "\" "))
        )
    (if (not (equal img-class ""))
        (setq result (concat result "class=\"" img-class "\" "))
      )
    (setq result (concat result "alt=\"" img-alt "\" >"))
    (save-excursion
      (delete-region (car img-filename-boundaries) (cdr img-filename-boundaries))
      (insert result))
    )
  )

;;Insert template file 
(defun insert-template-file()
  (interactive)
  (insert-file-contents "~/.emacs.d/lisp/template.html")
  )


(define-skeleton insert-article
  "insert <article> </article>"
  ""
  "<article>\n " _ "\n</article>"
  )

(define-skeleton insert-div
  "insert <div> </div>"
  ""
  "<div>\n " _ "\n</div>"
  )

(define-skeleton insert-p
  "insert <p> </p>"
  ""
  "<p>\n " _ "\n</p>"
  )

(defun zen-forward-paragraph()
  (interactive)
  (forward-paragraph)
  (forward-line -1)
  (goto-char (end-of-line))
  )

(defun zen-backward-paragraph()
  (interactive)
  (backward-paragraph)
  (forward-line 1)
  )

(defun zen-mark-paragraph()
  (interactive)
  (mark-paragraph)
  (forward-line 1)
  )

(provide 'zen-funcs)




