#lang racket

(define number 8)

(define (is_even number)
    (cond
        ((= (remainder number 2) 0) #t)
        (else #f)   
    )
)

(define (power_2 number)
    (* number number)
)

(define (power_2_if_even is_even power_2 number)
    (cond
        ((is_even number) (power_2 number))
        (else "number cant pass our validation")
    )
)

(power_2_if_even is_even power_2 number)