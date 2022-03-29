(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'evil)
(straight-use-package 'evil-collection)
(straight-use-package 'org)
(straight-use-package 'undo-tree)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/saves/"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

(global-undo-tree-mode 1)

(setq evil-want-integration t
      evil-want-keybinding nil
      evil-undo-system 'undo-tree)

(evil-mode 1)

(add-hook 'org-mode-hook
	  (lambda ()
	    (auto-fill-mode 1)
	    (setq fill-column 80)))

(set-face-attribute 'default nil :family "Terminus" :height 150)
