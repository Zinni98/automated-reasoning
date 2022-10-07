(set-option :produce-models true)

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

(assert (and (>= x 0) (>= y 0)))

(assert (= (+ x y) 9))

(assert (< (* x (* y y)) 200))

(maximize x :id ob)
(maximize y :id ob)

(check-sat)
(get-model)
(exit)