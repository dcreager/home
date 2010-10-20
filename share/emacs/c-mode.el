(setq c-indent-level 2
      c-substatement-open 0
      c-continued-statement-offset 2
      c-brace-offset 0 
      c-argdecl-indent 0
      c-label-offset -2)

(setq c-default-style
      '((other . "user")))


(defun my-c++-mode-hook ()
  (c-set-offset 'innamespace 0)
  (c-set-offset 'inextern-lang 0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'label '*)
  (c-set-offset 'case-label '*)
  (c-set-offset 'statement-case-intro '*)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'arglist-close 0)
  (setq c-basic-offset 4)
  (turn-on-font-lock)
)

(add-hook 'c++-mode-hook 'my-c++-mode-hook)


(defun my-java-mode-hook ()
  (c-set-offset 'inline-open 0)
  (c-set-offset 'label '*)
  (c-set-offset 'case-label '*)
  (c-set-offset 'statement-case-intro '*)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'arglist-close 0)
  (setq c-basic-offset 4)
  (turn-on-font-lock)
)

(add-hook 'java-mode-hook 'my-java-mode-hook)


(defun my-c-mode-hook ()
  (c-set-offset 'inextern-lang 0)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'label '*)
  (c-set-offset 'case-label '*)
  (c-set-offset 'statement-case-intro '*)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'arglist-close 0)
  (setq c-basic-offset 4)
  (turn-on-font-lock)
)

(add-hook 'c-mode-hook 'my-c-mode-hook)
