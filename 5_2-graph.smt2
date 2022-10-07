(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const e Int)
(declare-const f Int)
(define-fun g () Int 0)
(declare-const h Int)


(assert (or (= h (+ g 3)) (= h (+ e 8))))
(assert (or (= f (+ g 9)) (= f (+ d 5))))
(assert (or (= d (+ f 5)) (= d (+ e 3)) (= d (+ a 2))))
(assert (or (= e (+ d 3)) (= e (+ h 8)) (= e (+ c 7)) (= e (+ b 6))))
(assert (or (= a (+ d 2)) (= a (+ b 4))))
(assert (or (= b (+ a 4)) (= b (+ c 4)) (= b (+ e 6))))
(assert (or (= c (+ b 4)) (= c (+ e 7))))



(minimize b)


(check-sat)
(get-objectives)
(get-model)
(exit)