;;=====================================================================
;;基本设置
;;=====================================================================
(tool-bar-mode 0);不显示工具栏
(menu-bar-mode 0);;不显示菜单栏
(scroll-bar-mode 0);;不显示滚动条
(display-time-mode 0);;不显示时间
(setq frame-title-format "Emacs");;设置标题
;;=====================================================================
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'zenburn t);;主题
;; (setq zenburn-override-colors-alist
;;       '(("zenburn-bg+05" . "#282828")
;;         ("zenburn-bg+1"  . "#2F2F2F")
;;         ("zenburn-bg+2"  . "#3F3F3F")
;;         ("zenburn-bg+3"  . "#4F4F4F")))
;; (load-theme 'zenburn t)
;;=====================================================================

(setq default-directory "~/work/") ;;设置默认文件夹
(setq inhibit-startup-message t);;关闭启动画面
(global-linum-mode t);侧边显示行号
(electric-pair-mode t);自动补全
(show-paren-mode t);括号匹配高亮
(global-hl-line-mode 1);当前行高

;;(defun synchronize-theme ()
;;   (setq hour
;;         (string-to-number
;;          (substring (current-time-string) 11 13))) ;;closes (setq hour...
;;   (if (member hour (number-sequence 6 17))
;;       (setq now '(sanityinc-tomorrow-day))
;;     (setq now '(sanityinc-tomorrow-bright))) ;; end of (if ...
;;   (if (eq now custom-enabled-themes)
;;       nil
;;     (setq custom-enabled-themes now)
;;     (reapply-themes) ) ) ;; end of (defun ...

;; (run-with-timer 0 3600 'synchronize-theme)

(package-initialize)
;(add-to-list 'load-path "~/.emacs.d")

;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-zenburn)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("org". "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ("Marmable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
			 ("MELPA Stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")))


;;=====================================================================
;; AucTeX settings
;;=====================================================================

(mapc (lambda (mode)
	(add-hook 'LaTeX-mode-hook mode))
      (list 'turn-on-cdlatex
	    'reftex-mode
	    'outline-minor-mode
	    'flyspell-mode
	    'hide-body t
	    ))

;;添加CDLaTeX辅模式
(require 'texmathp)
(require 'cdlatex)

(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)

;; 将cdlatex设置为AUCtex的辅模式
(add-hook 'LaTex-mode-hook 'turn-on-cdlatex);with AUCTeX LaTeX mode
(add-hook 'laTex-mode-hook 'turn-on-cdlatex);with Emacs latex mode

;;自己写的
;(setq reftex-plug-into-AUCTeX t)
;;Emacs加载AUCTeX
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook (lambda()
			     ;;LaTeX模式下,不打开自动拆行
			     (turn-off-auto-fill)
			     ;;显示行数
			     (linum-mode 1)
			     ;;打开自动补全
                                        ;(auto-complete-mode 1)
			     ;;启动math mode
			     (LaTeX-math-mode 1)
			     ;;打开outline mode
			     (outline-minor-mode 1)
			     ;;
			     ))

;;=====================================================================
;;ESS
;;=====================================================================

(require 'ess-r-mode)

;;==================================================
;;yasnippet
;;==================================================

(yas-global-mode 1)
;; ;;设置xelatex为默认编辑命令,evience为默认阅读器
;; (setq Tex-output-view-style
;;       (quote(("^pdf" "." "evince &o %(outpage)")))

;;       (add-hook 'LaTeX-mode-hook
;; 		(lambda()
;; 		  (add-to-list 'TeX-command-list '("XeLaTeX" "% xelatex%(mode)'%t" TeX-run-TeX nit t))
;; 		  setq TeX-command-default "XeLaTeX")
;; 		))

;; ;;设置org导出tex模板，使其支持中文
;; (require 'org-latex)
;; (unless (boundp 'org-export-latex-classes)
;;   (setq org-export-latex-classes nil))
;; ;;输出latex模板
;; (add-to-list 'org-export-latex-classes
;; 	     '("article"
;; 	       "\\documentclass{article}
;;  \\usepackage{ctex}"
;; 	       ("\\section{%s}" . "\\section*{%s}")
;; 	       ;;("\\subsection{%s}" . "\\subsection{%s}")
;; 	       ;;("\\subsubsection{%s}" . "\\subsubsection{%s}")
;; 	       ("\\paragraph{%s}" . "\\paragraph{%s}")
;; 	       ("\\subparagraph{%s}" . "\\subparagraph{%s}")
;; 	       ))

                                        ;(mapc (lambda (mode)
                                        ;	(add-hook 'LaTeX-mode-hook mode))
                                        ;     (list 'turn-on-cdlatex
                                        ;	    'reftex-mode
                                        ;	    'outline-minor-mode
                                        ;	    'auto-fill-mode
                                        ;	    'flyspell-mode
                                        ;	    'hide-body t
                                        ;	    ))
;;(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
;; with AUCTeX LaTeX mode
;;(add-hook 'latex-mode-hook 'turn-on-cdlatex)
;; with Emacs latex mode

;;forward search and inverse search
;;(setq TeX-PDF-mode t)
;;(setq TeX-source-correlate-mode t)
;;(setq TeX-source-correlate-method 'synctex)
;;(setq TeX-view-program-list

;;==================================================
;; maxima
;;==================================================
(add-to-list 'load-path "/usr/share/emacs/site-lisp/maxima/")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
(add-to-list 'auto-mode-alist '("\\.ma[cx]" . maxima-mode))

;; ;;==================================================
;; ;;包管理
;; ;;==================================================

;; (require 'package)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (package-initialize)

;;    ;;   okular)


;; ;;=========================================================
;; ;;Maxima
;; ;;=========================================================

;; (autoload 'imaxima "imaxima" "Frontend of Maxima CAS" t)
;; (autoload 'imath "imath" "Interactive Math mode" t)
;; (autoload 'imath-mode "imath" "Interactive Math mode" t)

;; ;;============================================
;; ;;Octave
;; ;;============================================

;; (autoload 'octave-mode "octave-mod" nil t)
;; (setq auto-mode-alist
;;       (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; (autoload 'octave-help "octave-hlp" nil t)
;; (require 'gnuserv)
;; (gnuserv-start)

;; ;;==================================================
;; ;;matlab
;; ;;==================================================

;; ;;(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
;; ;; (add-to-list
;; ;;  'auto-mode-alist
;; ;;  '("\\.m$" . matlab-mode))
;; ;; (setq matlab-indent-function t)
;; ;;(setq matlab-shell-command "matlab")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d057f0430ba54f813a5d60c1d18f28cf97d271fd35a36be478e20924ea9451bd" default)))
 '(org-agenda-files (quote ("~/Work/2.18/limitsycle/limit_cycle.org")))
 '(package-selected-packages
   (quote
    (ein pygen zenburn-theme gnome-c-style elpy python-mode matlab-mode cdlatex use-package yasnippet math-symbol-lists company coffee-mode auto-correct auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
