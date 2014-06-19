(add-hook 'f90-mode-hook
          (lambda () 
	    (local-set-key [?\H-.] (lambda () 
				      (interactive) 
				      (insert "!!<summary></summary>") 
				      (backward-char 10)))
	    (local-set-key (kbd "H-y") (lambda () 
					  (interactive) 
					  (insert "!!<local name=\"\"></local>") 
					  (backward-char 10)))
	    (local-set-key (kbd "H-p") (lambda () 
					  (interactive) 
					  (insert "!!<parameter name=\"\"></parameter>") 
					  (backward-char 14)))
	    (local-set-key [?\H-'] (lambda () 
				      (interactive) 
				      (insert "!!<comments></comments>") 
				      (backward-char 11)))
	    (local-set-key [?\H-,] (lambda () 
				      (interactive) 
				      (insert "@CREF[]") 
				      (backward-char 1)))))

;;Customize the fortran to highlight % differently.
(make-face 'font-lock-special-fortrandocs-face)
(set-face-foreground 'font-lock-special-fortrandocs-face "#518751")
(make-face 'font-lock-special-fortrandoclink-face)
(set-face-foreground 'font-lock-special-fortrandoclink-face "#858751")
(make-face 'font-lock-special-fortrandocattr-face)
(set-face-foreground 'font-lock-special-fortrandocattr-face "#876951")
(make-face 'font-lock-special-fortrandocval-face)
(set-face-foreground 'font-lock-special-fortrandocval-face "#875187")
;;Also add a face for highlighting !![^<]+ red so that people will not
;;do it; it breaks the docstring parser and makes life hard.
(make-face 'font-lock-special-fortrandcommentpain-face)
(set-face-foreground 'font-lock-special-fortrandcommentpain-face "#9E1919")
(set-face-background 'font-lock-special-fortrandcommentpain-face "#FAE8E8")
(set-face-attribute 'font-lock-special-fortrandcommentpain-face nil
                              :weight 'bold)

(font-lock-add-keywords 'f90-mode
  '(
    ("!?<\\(/?\\(summary\\|usage\\|comments\\|parameter\\|errors\\|group\\|member\\|local\\|prereq\\|instance\\|outcome\\|mapping\\|run\\|global\\|revision\\|dimension\\)\\)[^>]*>" 1 'font-lock-special-fortrandocs-face prepend)
    ("\\(@CREF\\|QUIRK\\|TODO\\)" 1 'font-lock-special-fortrandoclink-face prepend) 
    ("!?<[a-z]+\\( +[a-z]+\\)=\"\\([A-Za-z0-9_ ,./]+\\)\"" 1 'font-lock-special-fortrandocattr-face prepend)
    ("!?<[a-z]+\\( +[a-z]+\\)=\"\\([A-Za-z0-9_ ,./]+\\)\"" 2 'font-lock-special-fortrandocval-face prepend)
;;    ("\\(!![^<]+\\)" 1 'font-lock-special-fortrandcommentpain-face prepend)
))

(make-face 'font-lock-special-fortranperc-face)
(make-face 'font-lock-special-fortranoper-face)
(set-face-foreground 'font-lock-special-fortranperc-face "#FF5252")
(set-face-attribute 'font-lock-special-fortranperc-face nil :height 75)
(set-face-foreground 'font-lock-special-fortranoper-face "#599EE3")

(defun add-custom-keyw-fortran()
  "adds a few special keywords to the fortran mode"
  ;
  (font-lock-add-keywords nil
   '(
     ("%" . 'font-lock-special-fortranperc-face )
     ("[-*+/]" . 'font-lock-special-fortranoper-face )
     )
   )
 )

(add-hook 'f90-mode-hook 'add-custom-keyw-fortran)
