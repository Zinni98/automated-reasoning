(set-option :produce-models true)

(declare-const o Int)
(declare-const g Int)
(declare-const r Int)
(declare-const p Int)
(declare-const b Int)

(declare-const s1 Int)
(declare-const s2 Int)
(declare-const s3 Int)
(declare-const s4 Int)
(declare-const res Int)

(assert (distinct o g r p b))


(assert (= (+ o b g) (+ r p p)))
(assert (= (+ b r) (+ g o b)))
(assert (= s1 (+ o b o)))
(assert (= s2 (+ b o)))
(assert (= s3 (+ b (/ b 2))))
(assert (= s4 (+ r o)))


(assert (or (= (* p 3) s1) (= (* p 3) s2) (= (* p 3) s3) (= (* p 3) s4)))

(check-sat)
(get-model)
(exit)


