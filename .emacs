(setq path "/usr/local/heroku/bin:/Users/rboyd/.rvm/gems/ruby-1.9.3-p194/bin:/Users/rboyd/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/rboyd/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/rboyd/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/rboyd/bin:/Users/rboyd/.rvm/bin")
(setenv "PATH" path)

(setq backup-directory-alist '(("." . "~/emacs-backups")))

(package-initialize)
(evil-mode 1)        ;; enable evil-mode

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(weblogger-config-alist (quote (("default" ("user" . "user") ("server-url" . "http://bravenewbits.com/xmlrpc/") ("weblog" . "1"))))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 220 :width normal :family "Inconsolata")))))

(add-to-list 'load-path "~/.emacs.d")  ; Add this directory to Emacs' load path

; for Chrome integration
(require 'edit-server)
(edit-server-start)

; twitter from emacs
(require 'twittering-mode)

(global-linum-mode t)

; simple darkroom with fullscreen, 
; fringe, mode-line, menu-bar and scroll-bar hiding.
(defvar darkroom-enabled nil)

(defun toggle-darkroom ()
  (interactive)
  (if (not darkroom-enabled)
      (setq darkroom-enabled t)
    (setq darkroom-enabled nil))
;  (hide-mode-line)
  (if darkroom-enabled
      (progn
        (fringe-mode 'both)
        (menu-bar-mode -1)
        (scroll-bar-mode -1)
        (set-fringe-mode 200)
	(ns-toggle-fullscreen))
    (progn 
      (ns-toggle-fullscreen)
      (fringe-mode 'default)
      (menu-bar-mode)
      (scroll-bar-mode t)
      (set-fringe-mode 2))))

; Activate with F11 - enhanced fullscreen :)
(global-set-key [f11] 'toggle-darkroom)


(require 'weblogger)

(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))


 ; Recursively generate tags for all *.clj files,
 ; creating tags for def* and namespaces
(setq path-to-ctags "/usr/local/bin/ctags")
(defun create-clj-tags (dir-name)
 "Create tags file."
 (interactive "Directory: ")
 (shell-command
  (format "%s  --langdef=Clojure --langmap=Clojure:.clj.cljs --regex-Clojure='/[ \t\(]*def[a-z]* \([a-z!-]+\)/\1/' --exclude=.js --regex-Clojure='/[ \t\(]*ns \([a-z.]+\)/\1/' -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name)))
 )
