;; 主题
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme) 

;; 其他主题
(add-to-list 'load-path "~/.emacs.d/color-theme/others")
(require 'molokai-theme)

;; 光标颜色
;;(set-cursor-color "blue")
 
;;中文字体
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font (frame-parameter nil 'font)
;;                       charset
;;                       (font-spec :family "Hannotate SC Regular" :size 16)))


