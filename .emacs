(setq path "/usr/local/heroku/bin:/Users/rboyd/.rvm/gems/ruby-1.9.3-p194/bin:/Users/rboyd/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/rboyd/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/rboyd/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/rboyd/bin:/Users/rboyd/.rvm/bin")
(setenv "PATH" path)

(package-initialize)
(evil-mode 1)        ;; enable evil-mode

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 240 :width normal :family "Inconsolata")))))

(add-to-list 'load-path "~/.emacs.d")  ; Add this directory to Emacs' load path

; for Chrome integration
(require 'edit-server)
(edit-server-start)

; twitter from emacs
(require 'twittering-mode)

(global-linum-mode t)

