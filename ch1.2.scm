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
(define (f n)
  (if (< n 3)
    n
    (+ (- n 1) (* (* 2 f) (- n 2)) (* (* 3 f) (- n 3)) )))
(f 3)









