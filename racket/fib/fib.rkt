;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname fib) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define
(fib_loop first second count n)
  (cond
    ((= (+ 1 count) n) (+ first second))
    (else (fib_loop second (+ first second) (+ 1 count) n))
  )
)


(define
(fib n )
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    ((= n 2) 1)
    (else (fib_loop 0 1 2 n))
  )
)

(define
(fib_sum n index)
  (cond
    ((= index  n)(fib index))
    (else (+ (fib index) (fib_sum n (+ index 1))))
  )
)

(fib 1)
(fib 13)
(fib 2)
(fib 7)
(fib_sum 7 0)

