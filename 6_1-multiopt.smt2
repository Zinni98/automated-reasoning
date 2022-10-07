(set-option :produce-models true)
(set-option :opt.priority pareto)

(declare-const x1 Int)
(declare-const x2 Int)

(assert (and (<= x1 10) (<= (- 0 10) x1)))
(assert (and (<= x2 10) (<= (- 0 10) x2)))

(assert (<= (- x2 2) 0))
(assert (<= (- (* x1 x1) 2) 0))


(minimize (- (* 2 x1) x2) :id c1)
(minimize (- x1) :id c2)

(check-sat)
(get-model)

(check-sat)
(get-model)

(check-sat)
(get-model)

(exit)
