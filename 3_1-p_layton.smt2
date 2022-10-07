
(set-option :produce-models true)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const e Int)

(define-fun max ((a Int) (b Int)) Int (ite (>= a b) a b))

; Decomposition
(assert (= e (max a (max b (max c d)))))

(assert (>= a 0))
(assert (>= b 0))
(assert (>= c 0))
(assert (>= d 0))

(assert (<= a 9))
(assert (<= b 9))
(assert (<= c 9))
(assert (<= d 9))

(assert (= (+ a c) d))
(assert (= (* a b) c))
(assert (= (- c b) b))
(assert (= (* a 4) d))

(assert (distinct a b c d))

(check-sat)
(get-model)
(exit)