; to display invislbes, M-x whitespace-mode
; to display in hex, M-x hexl-mode 

;; fix tab bullshit
(setq-default indent-tabs-mode 0)
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

; Save Sessions?
(desktop-save-mode 1)

;; package shit 
;revents package list refreshing every time you start emacs if you want that 
	;(when (not package-archive-contents)
	;    (package-refresh-contents))

; use the melpa archive for packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))

	;(setq package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
	;(("ELPA" . "http://tromey.com/elpa/") 
	; ("gnu" . "http://elpa.gnu.org/packages/")
	; ("marmalade" . "http://marmalade-repo.org/packages/")))

; Apparently needed for the package auto-complete (why?)
;the below doeesn't work..
;(add-to-list 'package-archives)
;(setq package-enable-at-startup nil) 
;(package-initialize 1)
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Add/Modify keyboard shortcuts / interaction methods
; Buffer Management
    (global-set-key (kbd "C-x C-b") 'ibuffer)
; Font
   (setq fnt "Spot Mono"
        ; "Geist Mono" 
        ; "Monaco" 
        ; "SF Mono"
        ; "Input Mono" 
        ; "M+ 1mn" 
        ; "Chivo Mono"
        ; "BPMono"
        ; "Everson Mono" 
        ; "Azeret Mono"
        ; "Sono"
        ; "M Plus Code Latin 60"
        ; "ProggyVector"
        ; "Atkinson Hypermono"
    )
    (set-face-attribute 'default nil :family fnt :weight 'regular :height 130)
; overwrite mode
    (delete-selection-mode 1)
; make scrolling less annoying
    (setq mouse-wheel-progressive-speed 0)
; window titles
    (setq frame-title-format "%b")
; GUI mode interface adjustments
    (when (display-graphic-p)                               ; if running in GUI
    (tool-bar-mode -1)                                      ; remove tool bar
    (scroll-bar-mode -1))                                   ; remove scroll bar
; remove menu bar
    (menu-bar-mode 0)
; inhibit startup screen
    (setq inhibit-startup-screen 1)
; disable annoying bell
    (setq ring-bell-function 'ignore)
; set tab key to 2 spaces
    (setq-default indent-tabs-mode 0)
    (setq-default tab-width 4)
    (setq indent-line-function 'insert-spaces)
    ; (setq indent-line-function 'insert-tab)
; session saver
    ; (desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;
; Themes and Plugins
    ; why doesnt this work at all?
    ; (let ((default-directory  "~/.emacs.d/lisp/"))
    ;     (normal-top-level-add-subdirs-to-load-path))

; Themes
    (if (display-graphic-p)
       ; Solarized
       ; (progn (add-to-list 'load-path "~/.emacs.d/lisp/_themes/solarized-emacs/")
       ;     (require 'cl-lib)
       ;     (require 'color)
       ;     (require 'solarized-faces)
       ;     ;;(require 'solarized-dark-theme)
       ;     (require 'solarized-light-theme)
       ; )
       ; Gruvbox
       ; (add-to-list 'load-path "~/.emacs.d/lisp/_themes/autothemer/")
       ; (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/dash.el/")
       ; (add-to-list 'load-path "~/.emacs.d/lisp/_themes/emacs-theme-gruvbox/")
       ; (require 'gruvbox-theme)
       ; (load-theme 'gruvbox 1)
       ; Tomorrow
        (progn (add-to-list 'load-path "~/.emacs.d/lisp/_themes/tomorrow/")
            (require 'tomorrow-night-eighties-theme)
            (load-theme 'tomorrow-night-eighties 1)
        )
       ; (progn (add-to-list 'load-path "~/.emacs.d/lisp/_themes/tomorrow/")
       ;     (require 'tomorrow-day-theme)
       ;     (load-theme 'tomorrow-day 1)
       ; )

       ; Dracula
       ; (progn (add-to-list 'load-path "~/.emacs.d/lisp/_themes/dracula-emacs/")
       ;          (require 'dracula-theme)
       ;          (load-theme 'dracula 1)
       ;     )
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
    ; (load "ess-site")
    ; (load "ess-autoloads") ; apparently this doesn't exist anymore?
    ; (if (eq system-type 'darwin)
    ; (setq inferior-ess-r-program "/usr/local/bin/R"))

; use the right path
    (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/exec-path-from-shell/")
    (require 'exec-path-from-shell)
    ;;(load "exec-path-from-shell.el")
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
   ; (eval-after-load "octave-mode"
   ;     '(progn
   ;         (
   ;         (define-key  (kbd "C-c i l") (octave-send-line))
   ; )))

    (defun my-octave-mode-hook ()
        (local-set-key (kbd "C-c i l") 'octave-send-line)
        (local-set-key (kbd "C-c i b") 'octave-send-block)
        (local-set-key (kbd "C-c i f") 'octave-send-defun)
        (local-set-key (kbd "C-c i r") 'octave-send-region)
        (local-set-key (kbd "C-c i s") 'octave-show-process-buffer)
        (local-set-key (kbd "C-c i h") 'octave-hide-process-buffer)
        (local-set-key (kbd "C-c i k") 'octave-kill-process)
    )
    (add-hook 'octave-mode-hook 'my-octave-mode-hook)

; Fix Python.el
    (setq python-shell-interpreter "python3")

; SQL Format (requires external formatter like pgformat, will add later)
   ; (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/sqlformat/")
   ; (require 'sqlformat)
   ; (setq sqlformat-command 'pgformatter)
   ; (setq sqlformat-args '("-s2" "-g"))
   ; (add-hook 'sql-mode-hook 'sqlformat-on-save-mode)

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

; enable inferior ruby
;    (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/inf-ruby")
;    (require 'inf-ruby)
;    (autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
;    (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;; enhanced ruby mode
    (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/enhanced-ruby-mode/")

;; must be added after any path containing old ruby-mode
    (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
    (add-to-list 'auto-mode-alist '("\\.rb\\'" . enh-ruby-mode))
    (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; csv mode
    (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/csv-mode/")
    (require 'csv-mode) 

;; reformatter mode
    (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/emacs-reformatter/")
    (require 'reformatter) 

;; sqlformat mode
    (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/sqlformat/")
    (require 'sqlformat) 

;; auto save mode
    (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/auto-save/")
    (require 'auto-save) 
    (setq auto-save-silent t)   ; quietly save
    (setq auto-save-delete-trailing-whitespace t)

;; popup el 
    (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/popup-el/")

;; auto save mode
    (add-to-list 'load-path "~/.emacs.d/lisp/_plugins/auto-complete/")
    (require 'auto-complete) 
(auto-complete-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" default))
 '(package-selected-packages '(markdown-mode exec-path-from-shell))
 '(scroll-conservatively 1000)
 '(scroll-margin 3))
;; word wrap
   (setq-default truncate-lines 0)
   (setq-default visual-line-mode 1)
;; commenting
   (global-set-key (kbd "C-?") (lambda ()
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
