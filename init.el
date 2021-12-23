;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add/Modify keyboard shortcuts / interaction methods
 ; buffer management 
   (global-set-key (kbd "C-x C-b") 'ibuffer)
 ; Font
   (setq fnt "Atkinson Hypermono")
   (set-face-attribute 'default nil :family fnt :weight 'regular :height 130)
 ; overwrite mode
   (delete-selection-mode 1)
 ; make scrolling less annoying
   (setq mouse-wheel-progressive-speed 0)
   (custom-set-variables
    '(scroll-conservatively 1000)
    '(scroll-margin 3))
 ; word wrap 
   (setq-default truncate-lines 0)
   (setq-default visual-line-mode 1)
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
   (when (display-graphic-p)
     (tool-bar-mode -1)
     (scroll-bar-mode -1))
 ; remove tool bar
   ;(tool-bar-mode 0)
 ; remove menu bar 
   (menu-bar-mode 0)
 ; inhibit startup screen 
   (setq inhibit-startup-screen 1)
 ; disable annoying bell
   (setq ring-bell-function 'ignore)
 ; set tab key to 2 spaces
   (setq-default indent-tabs-mode 0)
   (setq-default tab-width 2)
   (setq indent-line-function 'insert-tab)
 ; desktop save mode (session saver?)
   (desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;
;; Themes and Plugins
  ;why doesnt this work at all?
  ;(let ((default-directory  "~/.emacs.d/lisp/"))
  ;  (normal-top-level-add-subdirs-to-load-path))

 ; Themes
  (if (display-graphic-p) 
   ;; Solarized
     (progn (add-to-list 'load-path "~/.emacs.d/lisp/_themes/solarized-emacs/")
      (require 'cl-lib)
      (require 'color)
      (require 'solarized-faces)
      (require 'solarized-dark-theme)
   ;; Gruvbox
     ;(add-to-list 'load-path "~/.emacs.d/lisp/_themes/autothemer/")
     ;(add-to-list 'load-path "~/.emacs.d/lisp/_plugins/dash.el/")
     ;(add-to-list 'load-path "~/.emacs.d/lisp/_themes/emacs-theme-gruvbox/")
     ;(require 'gruvbox-theme)
     ;(load-theme 'gruvbox 1)
     )
  ) 

 ; Multiple Cursors
   (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/multiple-cursors.el/")
   (require 'multiple-cursors)
   (global-set-key (kbd "C-c C-a") 'mc/edit-lines)
   (global-set-key (kbd "C->") 'mc/mark-next-like-this)
   (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
   (global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)

 ; ess 
   (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/ESS/lisp/")
   (require 'ess-site)
   ;(load "ess-autoloads")
   ;(if (eq system-type 'darwin)
   ;  (setq inferior-ess-r-program "/usr/local/bin/R"))

 ; use the right path
   (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/exec-path-from-shell/")
   (require 'exec-path-from-shell) ;(load "exec-path-from-shell.el")
   (when (eq system-type 'darwin)
     (exec-path-from-shell-initialize))

 ; ssh.el
   (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/ssh-el")
   (require 'ssh)
   (add-hook 'ssh-mode-hook
             (lambda ()
               (setq ssh-directory-tracking-mode t)
               (shell-dirtrack-mode t)
               (setq dirtrackp nil)))

 ; Octave Key Bindings
   ;(eval-after-load "octave-mode"
   ;  '(progn
   ;     (
   ;     (define-key  (kbd "C-c i l") (octave-send-line))

   (defun my-octave-mode-hook ()
     (local-set-key (kbd "C-c i l") 'octave-send-line)
     (local-set-key (kbd "C-c i b") 'octave-send-block)
     (local-set-key (kbd "C-c i f") 'octave-send-defun)
     (local-set-key (kbd "C-c i r") 'octave-send-region)
     (local-set-key (kbd "C-c i s") 'octave-show-process-buffer)
     (local-set-key (kbd "C-c i h") 'octave-hide-process-buffer)
     (local-set-key (kbd "C-c i k") 'octave-kill-process))
   (add-hook 'octave-mode-hook 'my-octave-mode-hook)

 ; Fix Python.el
   (setq python-shell-interpreter "python3")

 ; SQL Format (requires external formatter like pgformat, will add later)
   ;(add-to-list 'load-path "~/.emacs.d/lisp/_plugins/sqlformat/")
   ;(require 'sqlformat)
   ;(setq sqlformat-command 'pgformatter)
   ;(setq sqlformat-args '("-s2" "-g"))
   ;(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)

 ; dockerfile mode 
   (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/dockerfile-mode/")
   (require 'dockerfile-mode)
   (setq dockerfile-mode-command "podman")

 ; center line mode 
   (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/centered-cursor-mode/")
	 (require 'centered-cursor-mode)

   (define-global-minor-mode my-global-centered-cursor-mode centered-cursor-mode
     (lambda ()
       (when (not (memq major-mode
                        (list 'Info-mode 'term-mode 'eshell-mode 'shell-mode 'erc-mode)))
         (centered-cursor-mode))))
   (my-global-centered-cursor-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; end 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" default))
 ;'(exec-path
 ;  '("/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_14" "/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_14" "/Applications/Emacs.app/Contents/MacOS/libexec" "/Applications/Emacs.app/Contents/MacOS/bin"))
 ;'(package-selected-packages '(exec-path-from-shell))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
