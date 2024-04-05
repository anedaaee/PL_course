#lang racket

(define str1 "ali geh")
(define str2 "eli awf")

(define (hamming_distance_loop str1 str2 index count)
    (cond 
            (( = (string-length str1) index) count)
            (else (cond 
                (( char=? (string-ref str1 index)(string-ref str2 index)) (hamming_distance_loop str1 str2 (+ index 1) count))
                (else (hamming_distance_loop str1 str2 (+ index 1) (+ count 1)))
            ))
    )
)
(define (hamming_distance str1 str2)
    (cond
        ((= (string-length str1) (string-length str2)) (hamming_distance_loop str1 str2 0 0))
        (else "two strings must have same length")
    )
)
(hamming_distance str1 str2)