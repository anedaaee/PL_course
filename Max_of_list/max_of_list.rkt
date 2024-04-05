;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
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
   ((list? list_value) (max_loop list_value 1 (list-ref list_value 0)))
   (else "input must be list")
 )
)


(max_list (list -5 -10 -12 -2 -5))