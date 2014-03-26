(add-to-list 'load-path "~/.emacs.d/browse-url")
(require 'browse-url-dwim)
(browse-url-dwim-mode 1)

;; place the cursor on a URL
;; press "C-c b"
;; select some text
;; press "C-c g"

;; to turn off confirmations
(setq browse-url-dwim-always-confirm-extraction nil)
