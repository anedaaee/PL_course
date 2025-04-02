#lang racket
#reader(lib "htdp-beginner-reader.ss" "lang")((modname max_of_list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define
(max_loop list_value index max)
(cond
 ((= index (- (length list_value) 1)) max)
 (else
  (cond
    ((> max (list-ref list_value index)) (max_loop list_value (+ index 1) max))
    (else (max_loop list_value (+ index 1) (list-ref list_value index)))
  )
)
)
)

(define
(max_list list_value)
 (cond
   ((list? list_value) 
    (cond 
      ((= (length list_value) 0)  (display "none"))
      ((= (length list_value) 1)  (list-ref list_value 0))
      (else (max_loop list_value 1 (list-ref list_value 0)))) 
    )
    
    
   (else "input must be list")
 )
)


;(max_list (list -5 -10 -12 -2 -5))
(max_list (list))
(max_list (list 1))
(max_list (list 1 7 5 3))
(max_list (list 1.15 (/ 12 5) (/ 169 14)))