;; 设置缺省路径
(setq default-directory "~/")

;; 取消滚动条
(set-scroll-bar-mode nil)

;; 取消工具栏
(tool-bar-mode 0)

;; 显示时间
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; 关闭出错声音
;;(setq visible-bell t)

;; 关闭启动时画面
(setq inhibit-startup-message t)

;; 关闭gnu启动画面
(setq gnus-inhibit-startup-message t)

;; 用y－or－n代替yes－or－no
(fset 'yes-or-no-p 'y-or-n-p)

;; 设置行列号
(setq column-number-mode t)
(setq line-number-mode t)

;; 设置粘贴缓冲条数（C-y）
(setq kill-ring-max 200)

;; 文字阅读
(setq default-fill-column 120)

;; 防止页面滚动时跳动
(setq scroll-margin 3  scroll-conservatively 10000)

;; 打开括号匹配显示
(show-paren-mode t)
;; 设置匹配括号时不跳动
(setq show-paren-style 'parenthesis)

;; C-k删除整行
(setq-default kill-whole-line t)

;; 启用版本控制
(setq version-control t)
;; 备份原始版本两次
(setq kept-old-versions 2)
;; 备份最新版本一次
(setq kept-new-versions 1)
;; 删除其余版本
(setq delete-old-versions t)
;; 设置备份路径
(setq backup-directory-alist '(("." . "~/.emacs.backups")))
;; 设置备份方法，直接copy
(setq backup-by-copying t)

;; 不产生备份文件
(setq make-backup-files nil)
;; 不生成临时文件
(setq-default make-backup-files nil)

;; 允许屏幕左移
(put 'scroll-left 'disabled nil) 
;; 允许屏幕右移
(put 'scroll-right 'disabled nil) 

;;允许外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;; 设置个人信息
(setq user-full-name "Deron")
(setq user-mail-address "DeronWangCh@gmail.com")

;; 自动在文件末增加一行
(setq require-final-newline t)

;; 设置字体大小
(set-default-font "Monaco-14")  

;;窗口间跳转（S-<up>,S-<down>）
(windmove-default-keybindings)

(global-set-key (kbd "S-M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-M-<down>") 'shrink-window)
(global-set-key (kbd "S-M-<up>") 'enlarge-window)
