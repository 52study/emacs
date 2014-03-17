;; 加载php-mode
(add-to-list 'load-path "~/.emacs.d/php")
(require 'php-mode)

;; 按手册补全（control-Tab）
(setq php-manual-path "~/.emacs.d/php/php-chunked-xhtml")

;; 查看手册
;; C-c RET：在浏览器中打开PHP手册（http://www.php.net/manual/en/）
;; C-c C-f：在PHP手册中查询光标所在文本

;; speedbar看到php文件
(eval-after-load "speedbar" '(speedbar-add-supported-extension ".php"))

;; 代码折叠
;; C-c S：展开所有代码
;; C-c H：折叠所有代码
;; C-c s：展开当前代码块
;; C-c h：折叠当前代码块
;; C-c c：展开／折叠当前代码块
(defun php-settings()
  (setq php-manual-path "~/.emacs.d/php-chunked-xhtml") ;; 这个也可以放进来
  (hs-minor-mode 1)
  (local-set-key "\C-cS" 'hs-show-all)
  (local-set-key "\C-cH" 'hs-hide-all)
  (local-set-key "\C-cs" 'hs-show-block)
  (local-set-key "\C-ch" 'hs-hide-block)
  (local-set-key "\C-cc" 'hs-toggle-hiding)
  )
(add-hook 'php-mode-hook 'php-settings)

;; 四格缩进
(setq-default c-basic-offset 4)

