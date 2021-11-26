(global-set-key (kbd "C-x C-b") 'ibuffer)

;;;; FONTS ;;;; 
;; (set-default-font "Inconsolata-11")
;; (set-default-font "Fira Mono Medium-9")
;; (set-default-font "Input Mono-8")
;; (set-default-font "Consolas-10")
;; (set-default-font "Input Mono Condensed-10")
;; (set-face-attribute 'default nil :family "Input Mono" :weight 'normal :height 120)
;; (set-face-attribute 'default nil :family "SF Mono" :weight 'bold :height 140)
;; (set-face-attribute 'default nil :family "IBM Plex Mono" :weight 'regular :height 120)
;; (set-face-attribute 'default nil :family "Nitti PX" :weight 'regular :height 140)
;; (set-face-attribute 'default nil :family "Source Code Pro" :weight 'regular :height 140)
;; (set-face-attribute 'default nil :family "Operator Mono Book" :weight 'regular :height 140)
;; (set-face-attribute 'default nil :family "Consolas" :weight 'regular :height 140)
;; (set-face-attribute 'default nil :family "Verdana" :weight 'regular :height 120)
;; (set-face-attribute 'default nil :family "PragmataPro" :weight 'regular :height 140)
;; (set-face-attribute 'default nil :family "CamingoCode" :weight 'regular :height 140)
;; (set-face-attribute 'default nil :family "Anonymous Pro" :weight 'regular :height 140)
;; (set-face-attribute 'default nil :family "Ubuntu Mono" :weight 'regular :height 140)
;; (set-face-attribute 'default nil :family "Consolas" :weight 'regular :height 130)
 (set-face-attribute 'default nil :family "Menlo" :weight 'regular :height 130)

(delete-selection-mode 1)

(setq frame-title-format "%b")

;; (setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)

;; (setq truncate-partial-width-windows nil)
(setq-default truncate-lines t)

;;;; COMMENTS ;;;;
;; (global-set-key (kbd "C-?") 'comment-region)
;; (global-set-key (kbd "C-M-/") 'uncomment-region)
(global-set-key (kbd "C-?") (lambda () 
 (interactive)
 (let (beg end)
     (if (region-active-p)
         (setq beg (region-beginning) end (region-end))
         (setq beg (line-beginning-position) end (line-end-position)))
     (comment-or-uncomment-region beg end))))

;;;; INTERFACE ;;;; 
;; only remove scroll  bar in GUI emacs 
(menu-bar-mode 0)
(tool-bar-mode 0)
  
(if (display-graphic-p) t
;;  (scroll-bar-mode 0)
)

;; (load-theme 'solarized-light t)
;; (load-theme 'solarized-dark t)
;; (load-theme 'sanityinc-tomorrow-day t)
   (load-theme 'solarized-dark t)
;; (load-theme 'zenburn t)
;; (load-theme 'monochrome t)

;;;; KEY NAVIGATION ;;;; 
(global-set-key (kbd "C-M-u") 'previous-line)
(global-set-key (kbd "C-M-j") 'next-line)
(global-set-key (kbd "C-M-h") 'backward-char)
(global-set-key (kbd "C-M-k") 'forward-char)

;;;; PACKAGE MANAGERS ;;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")
	     (package-initialize)
	     )

;;;; PACKAGE CONFIGURATION ;;;; 
(require 'ess)

(require 'multiple-cursors)
(global-set-key (kbd "C-c C-a") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)

;; (require 'sql-indent)
(eval-after-load "sql"
  '(load-library "sql-indent"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#cccccc" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#515151"))
 '(custom-safe-themes
   (quote
    ("39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "cab317d0125d7aab145bc7ee03a1e16804d5abdfa2aa8738198ac30dc5f7b569" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(fci-rule-color "#515151")
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (monochrome-theme zenburn-theme sql-mssql sql-indent solarized-theme multiple-cursors hc-zenburn-theme format-sql ess color-theme-sanityinc-tomorrow)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
