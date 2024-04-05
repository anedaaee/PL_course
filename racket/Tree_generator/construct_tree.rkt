#lang racket

(struct node (value left right))

(define some_list (list 3 4 5 6 "$" 7 "$"))


(define (illu tree)
 (cond
 ((node? tree)
 (display "(")
 (display (node-value tree))
 (display " ")
 (illu (node-left tree))
 (display " ")
 (illu (node-right tree))
 (display ")"))
 (else (display "$"))))

(define (tree_cunstructor_loop input_list index)
    
    (cond 
        ((< index (length input_list))    
            (cond
                ((number? (list-ref input_list index))
                    (node (list-ref input_list index) (tree_cunstructor_loop input_list (+ 1 (* 2 index))) (tree_cunstructor_loop input_list (+ 2 (* 2 index))))
                )(else 0)
            )   
        )(else 0)
    )
)
(define (tree_cunstructor input_list)
    (cond
        ((list? input_list) (tree_cunstructor_loop input_list 0))
        (else "input must be list")
    )
)
(illu (tree_cunstructor some_list))