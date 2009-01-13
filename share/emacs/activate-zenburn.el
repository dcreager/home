;;; Only try to load zenburn if color-theme is installed.  We don't
;;; have to check for the existence of zenburn, since we include it in
;;; ~/share/emacs/lib.

(if (require 'color-theme nil :t)
    (progn (require 'zenburn)
           (zenburn)))
