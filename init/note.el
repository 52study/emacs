;;  发布html时默认中文
(setq org-export-language-setup 
      (append org-export-language-setup '(("zh-CN" "作者" "日期" "目录" "脚注"))))
(setq org-export-default-language "zh-CN")

(setq org-default-notes-file (concat "~/notes/org/" "日记.org")) 
(define-key global-map "\C-cn" 'org-capture)
(setq org-capture-templates
      '(("d" "日记" entry (file+datetree "~/.notes/org/日记.org")
	"")
	("m" "MongoDB学习" entry (file "~/.notes/org/MongoDB学习.org")
	 "")
	("p" "PHP学习" entry (file "~/.notes/org/PHP进阶.org")
	 "")
	("i" "互赖" entry (file "~/.notes/org/互赖.org")
	 "")
	("s" "数据结构" entry (file "~/.notes/org/数据结构.org")
	 "")
	("c" "编译原理" entry (file "~/.notes/org/编译原理.org")
	 "")
	("e" "Emacs学习" entry (file "~/.notes/org/Emacs学习.org")
	 "")))


(require 'org-install)
(require 'org-publish)
;;编辑中文时自动折行
(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 
	  (lambda () (setq truncate-lines nil)))
 
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-publish-project-alist
     '(("note-org"
        :base-directory "~/.notes/org"
        :publishing-directory "~/.notes/html"
        :base-extension "org"
        :recursive t
        :publishing-function org-publish-org-to-html
	:headline-levels 3
	:section-number t
	:auto-preamble t
	:auto-sitemap t
	:html-link-up t 
	:html-link-home t
	:author "Deron"
	:email "DeronWangCh@gmail.com"
	:sitemap-filename "index.org"
	:sitemap-title "学习笔记"
        :style "<link rel=\"stylesheet\" href=\"./static/css/main.css\" type=\"text/css\" />")))
       ;; ("note-static"
       ;;  ;;:base-directory "~/.notes/org"
       ;;  :publishing-directory "~/.notes/html"
       ;;  :recursive t
       ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
       ;;  :publishing-function org-publish-attachment)
       ;; ("note" 
       ;;  :components ("note-org" "note-static")
       ;;  :author "DeronWangCh@gmail.com"
       ;;  )))



