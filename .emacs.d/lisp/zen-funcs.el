
;;change input method. Also, change
;; cursor color for different input methods.
;;(cyan - for "russian-computer", black - oterway.
(defun change-lang()
  (interactive)
  (if current-input-method 
      (set-cursor-color "Gray")
      (set-cursor-color "Cyan"))
  (setq default-input-method "russian-computer")
  (toggle-input-method)
  )


(defun select-in-parents()
  "Select text between parenthis brackets, exlude brackets"
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


(defun wrap-img-tag()
"Wrap image filename in <img> tag and interacrively ask for attributes"
  (interactive)
  (let (result img-filename img-alt img-id img-class img-filename-boundaries)
        (setq img-filename (thing-at-point 'filename))
        (setq img-filename-boundaries (bounds-of-thing-at-point 'filename))
        (setq img-alt (read-from-minibuffer "Enter alt for img:"))
        (setq img-id  (read-from-minibuffer "Enter id for img:"))
        (setq img-class (read-from-minibuffer "Enter class for img:"))
    (setq result (concat "<img src=\"" img-filename "\" "))
    (if (not (equal img-id ""))
        (setq result (concat result "id=\"" img-id "\" "))
        )
    (if (not (equal img-class ""))
        (setq result (concat result "class=\"" img-class "\" "))
      )
    (setq result (concat result "alt=\"" img-alt "\">"))
    (save-excursion
      (delete-region (car img-filename-boundaries) (cdr img-filename-boundaries))
      (insert result))
    )
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

(defun zen-copy-line()
  "Copy current line"
  (interactive)
  (let (p1 p2)
        (setq p1 (line-beginning-position))
        (setq p2 (line-end-position))
        (copy-region-as-kill p1 p2)
    ))

(defun insert-date ()
  "Insert current date yyyy-mm-dd."
  (interactive)
  (when (use-region-p)
    (delete-region (region-beginning) (region-end) )
    )
  (insert (format-time-string "%d-%m-%Y"))
  )

(defun zen-find-file-insert ()
"Insert contents of the file to the buffer"
(interactive)
(let (path-to-template answer)
  (setq answer (read-from-minibuffer "a - Альтернативный Солигорск\nt - Текстовый блог\nYour answer: "))
  (if (equal answer "a")
      (setq path-to-template "~/.emacs.d/templates/alt-soligorsk/")
    (setq path-to-template "~/.emacs.d/templates/text-blog/")
    )
  (with-temp-buffer
    (insert-file-contents (ido-read-file-name "Copy file: " path-to-template))
    (kill-new (buffer-string))
  )
  (insert(car kill-ring-yank-pointer)))
)


(defun zen-insert-tag(tagName)
  (interactive
  (list (ido-completing-read
 "enter tag: "
 (list "p" "div" "article" "pre" "h1" "h2" "h3" "br" ))) 
          )
    (let (p1 p2 newp2)
      (if (use-region-p)
          (progn
            (setq p1 (region-beginning))
            (setq p2 (region-end))
            )
        (let ((thing (bounds-of-thing-at-point 'symbol)))
          (setq p1 (car thing))
          (setq p2 (cdr thing))
          ) )
      (goto-char p2)
      (insert "\n</" tagName ">\n")
      (goto-char p1)
      (insert "\n<" tagName ">\n")
      (setq newp2 (+ p2 5 (* 2 (length  tagName))))
      (indent-region p1 newp2)
      ))


(defun xhm-update-title ( φnewTitle)
  "Update a HTML article's title and h1 tags.
Update the <title></title> and <h1>…</h1> of current buffer."
  (interactive
   (let (oldTitle full-title)
     (save-excursion
       (goto-char 1)
       (search-forward-regexp "<title>\\([^<]+?\\)</title>")
       (setq oldTitle (match-string 1 )))
     (list (read-string "New title:" oldTitle nil oldTitle "INHERIT-INPUT-METHOD"))))
  (let (p1 p2)
    (save-excursion
      (goto-char 1)

      (progn (search-forward "<title>")
             (setq p1 (point))
             (search-forward "</title>")
             (search-backward "<")
             (setq p2 (point))
             (delete-region p1 p2 )
             (goto-char p1)
             (setq full-title (concat φnewTitle " | Альтернативный Солигорск" ))
             (insert full-title))

      (if (search-forward "<h1>")
          (progn
            (setq p1 (point))
            (search-forward "</h1>")
            (search-backward "<")
            (setq p2 (point))
            (delete-region p1 p2 )
            (goto-char p1)
            (insert φnewTitle ))
        (progn
          (message "<h1> tag not found. adding"))))))



(provide 'zen-funcs)



