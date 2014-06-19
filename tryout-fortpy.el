;; Fortpy
(autoload 'fortpy:setup "fortpy" nil t)
(add-hook 'python-mode-hook 'fortpy:setup)
(setq fortpy:complete-on-percent t)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
