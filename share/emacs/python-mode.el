(setq auto-mode-alist (cons '("\\.pxd\\'" . python-mode)
                      (cons
                            '("\\.pyx\\'" . python-mode)
                            auto-mode-alist)))
