#lang racket

(define (simplify parameter) 
    (cond
        ((and (list? parameter) (= (length parameter) 3) (eq? (first parameter) '+)) (simplify_add parameter))
        ((and (list? parameter) (= (length parameter) 3) (eq? (first parameter) '-)) (simplify_minus parameter))
        ((and (list? parameter) (= (length parameter) 3) (eq? (first parameter) '*)) (simplify_mult parameter))
        ((and (list? parameter) (= (length parameter) 3) (eq? (first parameter) '/)) (simplify_div parameter))
        (else parameter)
    )
)


(define (simplify_add parameter)
    (cond
        ((and (list? parameter) (= (length parameter) 3) (number? (second parameter)) (number? (third parameter))) (+ (second parameter) (third parameter)))
        ((and (list? parameter) (= (length parameter) 3) (number? (second parameter)) (= (second parameter) 0) (not (number? (third parameter)))) (simplify (third parameter)))
        (else parameter)
    )
)

(define (simplify_minus parameter)
    (cond
        ((and (list? parameter) (= (length parameter) 3) (number? (second parameter)) (number? (third parameter))) (- (second parameter) (third parameter)))
        ((and (list? parameter) (= (length parameter) 3) (number? (second parameter)) (= (second parameter) 0) (not (number? (third parameter)))) (simplify (third parameter)))
        ((and (list? parameter) (= (length parameter) 3) (not (number? (second parameter))) (not (number? (third parameter)))) (list '- (simplify(second parameter)) (simplify (third parameter))))
        (else parameter)
    )
)

(define (simplify_mult parameter)
    (cond
        ((and (list? parameter) (= (length parameter) 3) (number? (second parameter)) (number? (third parameter))) (* (second parameter) (third parameter)))
        ((and (list? parameter) (= (length parameter) 3) (number? (second parameter)) (= (second parameter) 1) (not (number? (third parameter)))) (simplify (third parameter)))
        ((and (list? parameter) (= (length parameter) 3) (number? (second parameter)) (= (second parameter) 0) (not (number? (third parameter)))) 0)
        ((and (list? parameter) (= (length parameter) 3) (not (number? (second parameter))) (not (number? (third parameter)))) (list '* (simplify(second parameter)) (simplify (third parameter))))
        (else parameter)
    )
)
(define (simplify_div parameter)
    (cond
        ((and (list? parameter) (= (length parameter) 3) (number? (second parameter)) (number? (third parameter))) (/ (second parameter) (third parameter)))
        ((and (list? parameter) (= (length parameter) 3) (not (number? (second parameter))) (not (number? (third parameter)))) (list '* (simplify(second parameter)) (simplify (third parameter))))
        (else parameter)
    )
)




(define (derivato derivato_parameter derivato_ratio)
    (cond
        ((number? derivato_parameter) 0)
        ((and (symbol? derivato_parameter) (not (eq? derivato_parameter derivato_ratio))) 0)
        ((and (symbol? derivato_parameter) (eq? derivato_parameter derivato_ratio)) 1)
        ((and (list? derivato_parameter) (= (length derivato_parameter) 3) (eq? (first derivato_parameter) '*)) (list '* (second derivato_parameter) (derivato (third derivato_parameter) derivato_ratio)))
        ((and (list? derivato_parameter) (= (length derivato_parameter) 3) (eq? (first derivato_parameter) '/)) (list '/ (second derivato_parameter) (derivato (third derivato_parameter) derivato_ratio)))
        ((and (list? derivato_parameter) (= (length derivato_parameter) 3) (eq? (first derivato_parameter) '+)) (list '+ (derivato (second derivato_parameter) derivato_ratio) (derivato (third derivato_parameter) derivato_ratio)))
        ((and (list? derivato_parameter) (= (length derivato_parameter) 3) (eq? (first derivato_parameter) '-)) (list '- (derivato (second derivato_parameter) derivato_ratio) (derivato (third derivato_parameter) derivato_ratio)))
        ((and (list? derivato_parameter) (= (length derivato_parameter) 3) (eq? (first derivato_parameter) '^)) (list '* (third derivato_parameter) (list '^ (second derivato_parameter) (-(third derivato_parameter) 1) )))
        (else (write "Unsupported operation"))
    )
)

(define (integral integral_parameter integral_ratio)
    (cond
        ((number? integral_parameter) (list '* integral_parameter integral_ratio))
        ((and (symbol? integral_parameter) (not (eq? integral_parameter integral_ratio))) (list '+ (list '* integral_parameter integral_ratio) 'c))
        ((and (symbol? integral_parameter) (eq? integral_parameter integral_ratio)) ('+ (list '/ 2 (list '^ 2 integral_parameter)) 'c))
        ((and (list? integral_parameter) (= (length integral_parameter) 3) (eq? (first integral_parameter) '*)) (list '* (second integral_parameter) (integral (third integral_parameter) integral_ratio)))
        ((and (list? integral_parameter) (= (length integral_parameter) 3) (eq? (first integral_parameter) '/)) (list '/ (second integral_parameter) (integral (third integral_parameter) integral_ratio)))
        ((and (list? integral_parameter) (= (length integral_parameter) 3) (eq? (first integral_parameter) '+)) (list '+ (integral (second integral_parameter) integral_ratio) (integral (third integral_parameter) integral_ratio)))
        ((and (list? integral_parameter) (= (length integral_parameter) 3) (eq? (first integral_parameter) '-)) (list '- (integral (second integral_parameter) integral_ratio) (integral (third integral_parameter) integral_ratio)))
        ((and (list? integral_parameter) (= (length integral_parameter) 3) (eq? (first integral_parameter) '^)) (cond 
            ((eq? (second integral_parameter) integral_ratio) (list '+ (list '/ ( + (third integral_parameter) 1 ) (list '^ integral_ratio ( + (third integral_parameter) 1 ))) 'c))
            ((eq? (second integral_parameter) 'e) (cond
                ((and (list? (third integral_parameter)) (= (length (third integral_parameter)) 3) (eq? (first (third integral_parameter)) '*)) (list '+ (list '/ integral_parameter (second (third integral_parameter))) 'c))
                (else (list '+ integral_parameter 'c))
            ))
            ((eq? (third integral_parameter) integral_ratio) (list '+ (list '/ integral_parameter (list 'ln (second integral_parameter))) 'c))
            (else (write "Unsupported operation"))
        ))
        (else (write "Unsupported operation"))
    )
)


(define (Ra_loop number farja result)
    (cond 
        ((<= (expt (+ 0.001 result ) farja ) number) (Ra_loop number farja (+  0.001 result)))
        (else  (/(round (* result 1000)) 1000))
    )
)

(define (Ra number farja)
    (Ra_loop number  farja 0.001)
)

(define (calculator operator first_param second_param)
    (cond 
        ((eq? operator '+) (+ first_param second_param))
        ((eq? operator '-) (- first_param second_param))
        ((eq? operator '*) (* first_param second_param))
        ((eq? operator '/) (/ first_param second_param))
        ((eq? operator '^) (expt first_param second_param))
        ((eq? operator 'Ra) (Ra first_param second_param))
        ((eq? operator 'De) (derivato first_param second_param))
        ((eq? operator 'In) (integral first_param second_param))
        (else (write "Unsupported operation"))
    )
)

;;; (derivato '(- 6 (- (* 3 (^ x 3)) (* (/ 4 2) (^ x 5)))) 'x)

;;; (define sum_result (derivato '(- 6 (- (* 3 (^ x 3)) (* (/ 4 2) (^ x 5)))) 'x))
;;; (write sum_result)
;;; (write "\n")
;;; (simplify sum_result)

;;; (integral '(+ (^ x 2 ) (^ x 1)) 'x)
;;; (integral '(^ e (* 2 x)) 'x)
;;; (integral '(^ a x) 'x)

;;; (Ra 27 3)

;(simplify(calculator 'In '(- 6 (- (* 3 (^ x 3)) (* (/ 4 2) (^ x 5)))) 'x))
(simplify(calculator '+ 3 2))
(simplify(calculator '- 3 2))
(simplify(calculator '* 3 2))
(simplify(calculator '/ 3 2))
(simplify(calculator '^ 3 2))



(simplify(calculator 'Ra 16 2))
(simplify(calculator 'Ra 27 3))
(simplify(calculator 'Ra 15 2))

(simplify(calculator 'De '5 'x))
(simplify(calculator 'De '(- (+ x x) x) 'x))
(simplify(calculator 'De '(* y x) 'x))
(simplify(calculator 'De '(^ x 5) 'x))


(simplify(calculator 'In '(+ (^ x 2) (^ x 1)) 'x))
(simplify(calculator 'In '(^ 2 x) 'x))
(simplify(calculator 'In '(^ e (* 2 x)) 'x))
