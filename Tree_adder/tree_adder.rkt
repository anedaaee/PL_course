#lang racket

(struct node (value left right))

(define input_tree (node 3 (node 4 (node 7 (node 9 0 0) 0) 0) (node 5 0 0) ))
(define sum_result 0)

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

(define (tree_sum_loop tree)
    (cond ((node? tree)
            (+ (+ (tree_sum_loop (node-left tree)) (tree_sum_loop (node-right tree))) (node-value tree))
        )(else 0)
    )
)

(define (tree_sumation tree)
    (cond
        ((node? tree)
            (display (tree_sum_loop tree))
        )
        (else (display "input value must be tree"))
    )
)

(tree_sumation input_tree)
(display "\n")
(illu input_tree)