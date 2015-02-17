#lang racket

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))


; -- 1.1 --
; (define a 3)
; (define b (+ a 1))

; (+ a b (* a b))

; (if (and (> b a) (< b (* a b)))
;      b
;      a)

; (cond ((= a 4) 6)
;      ((= b 4) (+ 6 7 a))
;      (else 25))

; (+ 2 (if (> b a) b a ))

; (* (cond ((> a b) a)
;          ((< a b) b)
;          (else -1))
;      (+ a 1))



; -- 1.2 --
; (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
;     (* 3 (- 6 2) (- 2 7)))



; -- 1.3 --
; define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers.

; (define (sqr x) (* x x))
; (define (sqr-sum x y)
;   (+ (sqr x) (sqr y)))

; (define (mini x y)
;   (if (< x y) x y))
; (define (maxi x y)
;   (if (> x y) x y))

; (define (answer x y z)
;   (sqr-sum (maxi x y) (maxi z (mini x y))))
; (answer 1 2 3)



; -- 1.4 --
; first (if) is evaluated -- and inside of (if) you have ( a b ) and ((> b 0) + -) --
; which is creating an absolute value for b. if b is positive then + ... if b is negative then - .
; the + or - then gets applied as the operator to the second expression
; (which is the second operand of the definition expression).



; -- 1.5 --
; (define (p) (p))
; (define (test x y)
;     (if (= x 0)
;           0
;               y))

; applicative order:
; (test 0 (p))
; the first evaluation in the procedure is (test 0 (p)) which (if using applicative order),
; the operands will have to be eval'd. this results in a recrusive call p = p.
; so the entire procedure will barf.

; normal order:
; (test 0 (p))
; (define (test 0 (p))
;     (if (= 0 0)
;           0
;               y))
; --> 0
; in this example the (p) variable is never used because the if statement evaluates to 0.
; the operands (p) snuck through because 0 got used instead in the if statement.


; SQRT-ITER procedure
; (define (sqrt-iter guess x)
;   (if (good-enough? guess x)
;     guess
;     (sqrt-iter (improve guess x)
;                x)))

; (define (improve guess x)
;   (average guess (/ x guess)))

; (define (average x y)
;   (/ (+ x y) 2))

; (define (good-enough? guess x)
;   (< (abs (- (square guess) x)) 0.001))

; (define (sqrt x)
;   (sqrt-iter 1.0 x))

; (sqrt 9)



; -- 1.6 --
; (define (new-if  predicate then-clause else-clause)
;   (cond (predicate then-clause)
;         (else else-clause)))

; (define (sqrt-iter guess x)
;   (new-if (good-enough? guess x)
;     guess
;     (sqrt-iter (improve guess x)
;                x)))

; (define (improve guess x)
;   (average guess (/ x guess)))

; (define (average x y)
;   (/ (+ x y) 2))

; (define (good-enough? guess x)
;   (< (abs (- (square guess) x)) 0.001))

; (define (sqrt x)
;   (sqrt-iter 1.0 x))

; (sqrt 9)
; ----> INFINITE LOOP RECURSES
; because new-if contains a recursive function -- else-clause calls itself FOREVER



; -- 1.7 --
; explain why this doesn't work for very small or very large numbers?
; watch how guess changes from one iteration to the next
; and STOP when the change is a very sm fraction of the guess
; make a procedure do this -- is this better? for sm and large #s?

; (define (sqrt-iter guess x)
;   (if (good-enough? guess x)
;     guess
;     (sqrt-iter (improve guess x)
;                x)))

; (define (improve guess x)
;   (average guess (/ x guess)))

; (define (average x y)
;   (/ (+ x y) 2))

; (define (good-enough? guess x)
;   (< (abs (- (square guess) x) guess) (* guess .0001)))

; (define (sqrt x)
;   (sqrt-iter 1.0 x))

; (sqrt 1000000000000000)

; ---> BIG numbers this will take infinite amount of time because sm changes
; ---> tiny numbers break bc of the good-enough? tolerance (0.001)
; this puts things in terms of absoulte value (instead of % or an relative tolerance)



; -- 1.8 --
; (define (cube-rt-iter guess previous-guess x)
;   (if (good-enough? guess previous-guess)
;     guess
;     (cube-rt-iter (improve guess x)
;                   guess
;                   x)))

; (define (improve guess x)
;   (/ (+ (/ x
;            (square guess))
;         (* 2 guess))
;      3))

; (define (good-enough? guess previous-guess)
;   (< (abs (- guess previous-guess))
;      .0001))

; (define (cube-rt x)
;   (cube-rt-iter 1.0 0 x))

; (cube-rt 9)
