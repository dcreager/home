(require 'timeclock)
(setq timeclock-file (convert-standard-filename "~/private/timelog"))
(define-key ctl-x-map "ti" 'timeclock-in)
(define-key ctl-x-map "to" 'timeclock-out)
(define-key ctl-x-map "tc" 'timeclock-change)
(define-key ctl-x-map "tr" 'timeclock-reread-log)
(define-key ctl-x-map "tu" 'timeclock-update-modeline)
(define-key ctl-x-map "tw" 'timeclock-when-to-leave-string)
(add-hook 'kill-emacs-query-functions 'timeclock-query-out)