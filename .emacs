(setq load-path (cons "~/share/emacs/lib" load-path))
(setq load-path (cons "~/platforms/all/share/emacs/site-lisp" load-path))

(defun chomp (str) (substring str 0 -1))


;;; Provide easier access to the HOST and HOSTOS environment variables
;;; (which are set by the bash startup scripts).

(setq host (chomp (shell-command-to-string "hostname -s")))
(setq host-os (chomp (shell-command-to-string "uname")))


;;; Loads all of the .el files in a directory, if that directory
;;; exists.

(defun load-files-in-directory (directory)
  (if (file-directory-p directory)
      (dolist (file (directory-files directory :t "\.el$"))
	(load file))))


;;; Look for "pre" OS-specific and host-specific directories of .el
;;; files

(load-files-in-directory (concat "~/share/emacs/os/" host-os "/pre"))
(load-files-in-directory (concat "~/share/emacs/host/" host "/pre"))


;;; And then load the .el files in the always-loaded directory

(load-files-in-directory "~/share/emacs")


;;; Look for "post" OS-specific and host-specific directories of .el
;;; files

(load-files-in-directory (concat "~/share/emacs/os/" host-os "/post"))
(load-files-in-directory (concat "~/share/emacs/host/" host "/post"))
