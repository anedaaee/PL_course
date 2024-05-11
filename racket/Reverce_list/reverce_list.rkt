#lang racket

(define
(reverse_loop list_value index)
(cond
 ((= 0 index) (list(list-ref list_value 0)))
 (else (append (list(list-ref list_value index)) (reverse_loop list_value (- index 1))))
)
)



(define
(reverse_list list_value)
 (cond
    ((= (length list_value) 0) (list))
   ((list? list_value) (reverse_loop list_value (- (length list_value) 1)))
   (else "input must be list")
 )
)

(define 
  (print_list_loop list_value index)
     (cond 
      (
        (= index (-(length list_value) 1))
        (display (list-ref list_value index))
      )
      (else
        (display (list-ref list_value index))
        (display " , ")
        (print_list_loop list_value (+ index 1))
      )
    ) 
  )

(define
  (print_list list_value)
  (cond
  ((= (length list_value) 0) (display "[]"))
  (
    (list? list_value)
    (display "[ ")
    (print_list_loop list_value 0)
    (display "]\n")
  )
  (else
    (display "value must be list")
  )
  ) 
)
;(print_list (reverse_list (list 1 2 3 4 5 6 12)))
;(length (list)) 
(print_list(reverse_list (list)))
(display "\n")
(print_list (reverse_list (list 1)))
(display "\n")
(print_list (reverse_list (list 1 2 3 4)))