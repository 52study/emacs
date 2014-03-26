;;; init ide environment(include tabbar,cscope)

;;; code
;; 进入view-mode快捷键
(global-set-key [(f4)] 'view-mode)
(add-to-list 'load-path "~/.emacs.d/ide")
;; cscope 
(require 'xcscope)
(setq exec-path (cons "/usr/local/bin" exec-path))  
;; 打开cscope时不更新，提高索引速度 
(setq cscope-do-not-update-database t)

;; tabbar
(require 'tabbar)  
(tabbar-mode 1)  
;; M-j上一个Buffer M-k下一下Buffer
(global-set-key [(alt up)] 'tabbar-backward)  
(global-set-key [(alt down)] 'tabbar-forward) 

;; 设置默认主题: 字体, 背景和前景颜色，大小
(set-face-attribute 'tabbar-default nil
 :background "gray80"
 :foreground "gray30"
 :height 1.0
)
;; 设置左边按钮外观：外框框边大小和颜色
(set-face-attribute 'tabbar-button nil 
 :inherit 'tabbar-default
 :box '(:line-width 1 :color "gray30")
)
;; 设置当前tab外观：颜色，字体，外框大小和颜色
(set-face-attribute 'tabbar-selected nil
 :inherit 'tabbar-default
 :foreground "DarkGreen"
 :background "LightGoldenrod"
 :box '(:line-width 2 :color "DarkGoldenrod")
 ;;:overline "black"
 ;;:underline "black"
 :weight 'bold
)
;; 设置非当前tab外观：外框大小和颜色
(set-face-attribute 'tabbar-unselected nil
 :inherit 'tabbar-default
 :box '(:line-width 2 :color "gray70")
)

(defun re-tabbar-buffer-groups ()
  (list
   (cond
     ((string-equal "*" (substring (buffer-name) 0 1))
      "self"
      )
     ((eq major-mode 'org-mode)
      "org"
      )
     (t
      "user")
    ))
) 
(setq tabbar-buffer-groups-function 're-tabbar-buffer-groups) 

(require 'ido)
(ido-mode t)


