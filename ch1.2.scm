; --- 1.9 ---
#lang racket

; (define (+ a b)
;   (if (= a 0)
;     b
;     (inc (+ (dec a) b))))
; (+ 4 2)

; this is linearly recursive because you'll build up a series of inc's
; they can't be evaluated until a = 0 in (dec a)
; SO, way cooler beacuse of the recursive call to +
; each time through. only after these recursive calls can inc be called.

; (define (+ a b)
;   (if (= a 0)
;     b
;     (+ (dec a) (inc b))))

; (+ 1 5)
; this is way different beacuse dec + inc are added together each time
; so it doesn't build up a tree because no operations are deferred.


;--- 1.10 ---
; (define (A x y)
;   (cond ((= y 0) 0)
;         ((= x 0) (* 2 y))
;         ((= y 1) 2)
;         (else (A (- x 1)
;                  (A x (- y 1))))))
; (A 3 3)
; f -- f(n) = 2n
; g -- g(n) = 2^n (if n > 0)
; g -- g(n) = 0 (if n = 0)
; h --



; --- 1.11 ---
; (define (f n)
;   (if (< n 3)
;     n
;     (+ (f (- n 1))
;        (* 2 (f (- n 2)))
;        (* 3 (f (- n 3))))))
; (f 6)
; recursive way

; (define (f n)
;   (if (< n 3)
;     n
;     (f-iter 2 1 0 n)))
; (define (f-iter a b c count)
;   (if (< count 3)
;     a
;     (f-iter (+ a (* 2 b) (* 3 c))
;             a
;             b
;             (- count 1))))
; (f 5)
;iterative way -- never calls itself. copy of fib-iter



; --- 1.12 ---
; pascal's triangle
; generating function for nth row = (x + 1)^n

; (define (pascal row col)
;   (cond ((< row col) #f)
;         ((or (= 0 col) (= row col)) 1)
;         (else (+ (pascal (- row 1) col)
;                  (pascal (- row 1) (- col 1))))))
; (pascal 6 3)



; --- 1.13 ---
; prove that fib(n) is the closest
; (define (fib n)
;   (cond ((= n 0) 0)
;         ((= n 1) 1)
;         (else (+ (fib (- n 1))
;                  (fib (- n 2))))))

; (define psi
;   (/ (- 1 (sqrt 5)) 2))

; (define phi
;   (/ (+ 1 (sqrt 5)) 2))

; (define (^ base exponent)
;   (define (*^ exponent acc)
;     (if (= exponent 0)
;       acc
;       (*^ (- exponent 1) (* acc base))))
;   (*^ exponent 1))

; (define (proof n)
;   (/ (^ phi n) (sqrt 5)))
; (proof 1)
