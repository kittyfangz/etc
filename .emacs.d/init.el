(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq evil-want-keybinding nil)

(let ((package '(evil evil-collection org))
      (content-not-refreshed t))
  (mapc
   (lambda (name)
     (unless (package-installed-p name)
       (when content-not-refreshed
	 (package-refresh-contents)
	 (setq content-not-refreshed t))
       (package-install name))
     (require name))
   package))

(evil-mode 1)

(add-hook 'org-mode-hook
	  (lambda ()
	    (auto-fill-mode 1)
	    (setq fill-column 80)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil-collection org evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
