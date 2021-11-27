;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add/Modify keyboard shortcuts / interaction methods 
 ; buffer management 
   (global-set-key (kbd "C-x C-b") 'ibuffer)
 ; Font
   (set-face-attribute 'default nil :family "Menlo" :weight 'regular :height 130)
 ; overwrite mode
   (delete-selection-mode 1)
 ; mouse wheel scrolling
   (setq mouse-wheel-progressive-speed nil)
 ; word wrap 
   ;(setq-default truncate-lines t)
   (setq-default visual-line-mode t)
 ; commenting 
   (global-set-key (kbd "C-?") (lambda () 
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end))))
 ; window titles 
   (setq frame-title-format "%b")
 ; remove scroll bar (in GUI mode only)
   (if (display-graphic-p) t
   ;;  (scroll-bar-mode 0)
   ) 
 ; remove tool bar 
   (tool-bar-mode 0)
 ; remove menu bar 
   (menu-bar-mode 0)
 ; inhibit startup screen 
   (setq inhibit-startup-screen t)

;;;;;;;;;;;;;;;;;;;;;
;; Themes and Plugins
  ;why doesnt this work at all?
  ;(let ((default-directory  "~/.emacs.d/lisp/"))
  ;  (normal-top-level-add-subdirs-to-load-path))

 ; Autothemer (req by some plugins)

 ; Solarized
   ;(add-to-list 'load-path "~/.emacs.d/lisp/_themes/solarized-emacs/")
   ;(require 'cl-lib)
   ;(require 'color)
   ;(require 'solarized-faces)
   ;(require 'solarized-dark-theme)

 ; Gruvbox
   (add-to-list 'load-path "~/.emacs.d/lisp/_themes/autothemer/")
   (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/dash.el/")
   (add-to-list 'load-path "~/.emacs.d/lisp/_themes/emacs-theme-gruvbox/")
   (require 'gruvbox-theme)
   (load-theme 'gruvbox t)

 ; Multiple Cursors
   (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/multiple-cursors.el/")
   (require 'multiple-cursors)
   (global-set-key (kbd "C-c C-a") 'mc/edit-lines)
   (global-set-key (kbd "C->") 'mc/mark-next-like-this)
   (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
   (global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)

 ; ess 
   (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/ESS/lisp/")
   ;(load "ess-autoloads")
   (require 'ess-site)
   (if (eq system-type 'darwin)
     (setq inferior-ess-r-program "/usr/local/bin/R"))

 ; sql indent
