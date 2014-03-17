;;; gtd.el --- init gtd environment

;; 使用流程
;; 1. 打开emacs后即默认进入查看一周的事务规划
;; 2. 打开inbox(C-cc -> 选择I)，把脑中的事务移植到inbox中(即收集)(C-cC-c可保存退出)
;; 3. 把inbox中事务归档到project、task和idea中(C-cC-w -> 选择标签)
;; 4. 随时查看事务规划(C-ca或C-ct)

;; 常用快捷键
;; C-cc       打开remember
;; C-ci       打开inbox
;; C-ct       打开todo列表
;; C-cC-t     选择todo list
;; C-cC-w     事务转接
;; C-cC-cC-c  选择标签
;; C-cC-cRet  自定义标签

;; [GTD] 
;; 一、核心：
;; “把所有事情都从你的脑袋里弄出来。在事情出现，而不是在事情爆发的时候，就做好相关的一系列决定。以合适的类
;; 别组织好你的项目的各种提醒以及下一步的行动。保持你的系统更新和完整，充分地检查，使你在任何时候都能信任
;; 你地对于你正在做（或者不做）的事情直觉的选择。”
;; 二、附加原则：
;; 任何事情如果花的时间少于两分钟，那么马上就去做。两分钟是一个分水岭，这样的时间和正式地推迟一个动作所花
;; 的时间差不多。 
;; 三、基本步骤：
;; 1.系统收集你所关心的和必须要做的所有事情（把你脑中的想法全部倒出来）。
;; 2.将记录下的事情分类（即将前期混乱的想法整理归档，以便后期处理）。
;; 3.规划确定下一步做什么。
;; 4.归档已完成的想法。
;; 5.每周回顾

;; [要事第一]
;; 事务公共分类:
;; 重要&紧迫 | 重要&不紧迫 | 不重要&紧迫 | 不重要&不紧迫
;; 以“重要不紧迫”事务为重心处理协调“重要紧迫”事务（见《高效人士的七个习惯》）

;; Org实现过程原理
;; + 配置org-agenda可查看本周事务，该功能可完成GTD一周事务回顾
;; + 文件task.org，project.org等可组织任务和项目等
;; + remember-mode可空白插入新事务，相当于新建事务
;; + tags可完成标记事务以及搜索功能，tags可公共可私有，例如project私有“BUG”和“新需求”标签
;; + todo可完成标识事务进程
;; + emacs提供取一个文件中某个事务插入到另一个事务的方法
;; + org支持html标记，支持到处pdf、html等 

;; 扩展
;; + 引入时间线clock-in(第四代时间管理是以人为重，淡化时间)

;; version: 1.0.0
;; author: wang.delong
;; email: DeronWangCh@gmail.com


;;; code:

;; 默认开启org缩进方式
(setq org-startup-indented t)

;; 绑定remember-mode
(global-set-key "\C-cc" 'remember)

;;; GTD收集项目模版设置
(require 'org-remember) 
(org-remember-insinuate) 
(setq org-directory "~/.gtd/")

;; %?——输入文字 
;; \n——插入换行符 
;; %i——插入选择区域 
;; %a——当前光标所在标题的链接
;; %t——插入日期 
;; %g从目标容器的标签中选择 
;; %G——从全局标签中选择
(setq org-remember-templates '(
			       ("Inbox" ?I "** TODO %^{Brief Description} %^g\n%?" "~/.gtd/inbox.org" "收集")
			       ("Task" ?t "** TODO %^{Brief Description} %^g\n\n%?" "~/.gtd/task.org" "任务")
			       ("Project" ?p "** NEXT %^{Brief Description} %^g\n%?" "~/.gtd/project.org" "项目") 
			       ("Idea" ?i "** SOMEDAY %^{Brief Description} %^g\n%?" "~/.gtd/idea.org" "灵感"))) 

;; 将项目转接在各个文件之间，方便清理和回顾
(custom-set-variables
 '(org-refile-targets 
  (quote 
   (("inbox.org" :level . 1) ("task.org" :level . 1) ("project.org" :level . 1) ("idea.org" :level . 1) ("trash.org" :level . 1) ("finished.org":level . 1)))))

;; 快速启动 agenda-view
(define-key global-map "\C-ca" 'org-agenda-list)
(define-key global-map "\C-ct" 'org-todo-list)
(define-key global-map "\C-cm" 'org-tags-view)
;;显示他们的内容
(setq org-agenda-files
      (list "~/.gtd/task.org"
	    "~/.gtd/idea.org"
	    "~/.gtd/project.org"
	    "~/.gtd/finished.org"))

;; 快速打开inbox
(defun inbox() (interactive) (find-file "~/.gtd/inbox.org")) 
(global-set-key "\C-ci" 'inbox)

;; TODO(t)      最基本的任务状态，现在要做，但还没计划做的时间
;; NEXT(n)      下一步行动，还尚未开始计划
;; SOMEDAY(s)   想法，还没决定是否开始行动
;; DONE(d)      已经完成，需要记录时间和备注说明，转移到finish.org
;; ABORT(a)     取消的任务，需要说明取消原因，转移到trash.org的相应节点中
;; WAITING(w)   等待其他人完成
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "SOMEDAY(s@/!)" "|" "ABORT(a@/!)"))))
;; 颜色配置规则：红灯停，绿灯行，黄灯亮了等一等
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "green" :weight bold)
              ("NEXT" :foreground "green" :weight bold)
              ("DONE" :foreground "red" :weight bold)
              ("WAITING" :foreground "yellow" :weight bold)
              ("SOMEDAY" :foreground "yellow" :weight bold)
              ("ABORT" :foreground "red" :weight bold))))
(setq org-todo-state-tags-triggers
      (quote (("TODO" ("DONE") ("ABORT"))
	      ("NEXT" ("DONE") ("ABORT"))
	      ("WAITTING" ("DONE") ("ABORT"))
	      ("SOMEDAY" ("TODO") ("ABORT"))
	      ("DONE" ("DONE" . t))
              ("ABORT" ("ABORT" . t)))))

;; tags 
; Global tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@office" . ?O)
                            ("@home" . ?H)
                            (:endgroup)
                            ("重要" . ?i)
                            ("紧迫" . ?u))))

; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)

;;开机自动显示日程表
(org-agenda-list t)
;;关闭其它窗口
(delete-other-windows)

;; ;; shut down buffers about gtd
;; (defun shut-down-agenda () 
;;   (interactive)
;;   (kill-buffer "*Org Agenda*") 
;;   (kill-buffer "finished.org")
;;   (kill-buffer "idea.org")
;;   (kill-buffer "project.org")
;;   (kill-buffer "task.org"))







