(set-option :produce-models true)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)


(define-fun divide-four ((x Int) (y Int) (z Int)) Bool (ite (= (mod (+ (* x 100) (* y 10) z) 4) 0) true false))

(assert (<= a 9))
(assert (> a 0))
(assert (<= b 9))
(assert (>= b 0))
(assert (<= c 9))
(assert (> c 0))

(assert (divide-four a b c))
(assert (divide-four c b a))

(check-sat)
(get-model)
(exit)

