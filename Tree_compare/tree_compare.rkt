#lang racket

(struct node (value left right))

(define input_tree1 (node 3 (node 4 (node 7 (node 9 0 0) 0) 0) (node 5 (node 9 0 0) 0) ))
(define input_tree2 (node 3 (node 4 (node 7 (node 9 0 0) 0) 0) (node 5 0 0) ))

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

(define (tree_compare_loop tree1 tree2)
    (cond
        ((and (node? tree1) (node? tree2))
            (cond
                (( = (node-value tree1) (node-value tree2))
                    (and (tree_compare_loop (node-left tree1) (node-left tree2)) (tree_compare_loop (node-right tree1) (node-right tree2)))
                )(else #f)
            )
        )(else (cond
                ((node? tree1) #f)
                ((node? tree2) #f)
                (else #t)
            )
        )
    )   
)

(define (tree_compare tree1 tree2)
    (cond
        ((and (node? tree1) (node? tree2))
            (tree_compare_loop tree1 tree2)
        )
        (else (display "input value must be tree"))
    )
)

(tree_compare input_tree1 input_tree2)
(display "\n")
(illu input_tree1)
(display "\n")
(illu input_tree2)
(display "\n")