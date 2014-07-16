;(tool-bar mode -1)
;(menu-bar mode -1)
;(add-to-list 'load-path "/usr/share/emacs23/site-lisp/slime/")
;(setq inferior-lisp-program "/usr/bin/clisp")
;(require 'slime)
;(slime-setup '(slime-fancy))
;(slime)
;
;(defun lisp-indent-or-complete &(optional arg)
;    (interactive "p")
;    (if (or (looking-back "^\\s=*") (bolp))
;        (call-interactively 'lisp-indent-line)
;        (call-interactively 'slime-indent-and-complete-symbol)))
;        (eval-fater-load "lisp-mode"
;                         '(progn
;                            (define-key lisp-mode-map (kdb "TAB") 'lisp-indent-or-complete)))
;; font setting
(add-to-list 'default-frame-alist '(font .   "-unknown-WenQuanYi Zen Hei Mono-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")) (set-face-attribute 'default t :font "-unknown-WenQuanYi Zen Hei Mono-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1")

;; mediawiki
(require 'mediawiki)
(setq mediawiki-site-alist
      (append '("wiki" "http://10.0.0.174/wiki/index.php" "wangyahui" "wangyahuiwiki" "首页")
              mediawiki-site-alist))

;; -*- mode: elisp -*-
;; Disable the splash screen (to enable it agin, replace the t with 0)
;;(setq inhibit-splash-screen t)

;; Enable transient mark mode
;;(transient-mark-mode 1)

;;;;org-mode configuration
;; Enable org-mode
(require 'org)
;; Make org-mode work with files ending in .org
 (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-ca" 'org-agenda)
;; The above is the default in recent emacsen


;; ibus support
;;(add hook 'after-init-hook 'ibus-modeon)
;;(ibus-define-common-key ?\C-\s nil)
;;(global-set-key (kbd "\C-\\") 'ibus-"

;; ibus support
(add-to-list 'load-path "/usr/share/emacs23/site-lisp/ibus/ibus-el")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(setq ibus-agent-file-name "/usr/lib/ibus-el/ibus-el-agent")
 ;; Use C-SPC for Set Mark command
; (ibus-define-common-key ?\C-\s nil)
 ;; Use C-/ for Undo command
 ;(ibus-define-common-key ?\C-/ nil)
 ;; Change cursor color depending on IBus status
 (setq ibus-cursor-color '("red" "blue" "limegreen"))
(global-set-key (kbd "s-SPC") 'ibus-toggle);; super-space

;;
(global-auto-revert-mode 1)

;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;org-mode configuration
;; Enable org-mode
(require 'org)
;; Make org-mode work with files ending in .org
 (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-ca" 'org-agenda)
;; The above is the default in recent emacsen


(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WATTING" "DONE")))
(setq org-todo-keywords
           '((sequence "TODO(t)" "IN-PROGRESS(i)" "|" "DONE(d)")
             (sequence "|" "CANCELED(c)")))
(setq org-todo-keyword-faces
           '(("TODO" . org-warning)
	     ("IN-PROGRESS" . (:foreground "LimeGreen" :weight bold))
             ("CANCELED" . (:foreground "grey39" :weight bold))))
(setq org-agenda-files (quote("~/Note/work.org"
			 "~/Note/todo/todo.org")))
      
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Note/todo/todo.org" "~/Note/work.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; org2blog
(add-to-list 'load-path (expand-file-name "~/.emacs.d/wordpress-mode/wordpress-mode.el"))
(require 'wordpress-mode) 

(add-hook 'php-mode-hook '(lambda ()
                            (if (wp/exists)
                              (wordpress-mode))))
