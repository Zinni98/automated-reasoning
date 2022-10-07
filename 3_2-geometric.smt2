(set-option :produce-models true)

(declare-const ax Real)
(declare-const ay Real)
(declare-const bx Real)
(declare-const by Real)
(declare-const m Real)
(declare-const q Real)
(declare-const x Real)


(define-fun f ((y Real)) Real (- 0 (/ q m)))

(assert (= ax 1))
(assert (= ay 3))
(assert (= bx 2))
(assert (= by 7))
(assert (= m (/ (- by ay) (- bx by))))
(assert (= q (- ay (* m ax))))
(assert (= x (f 0)))


(check-sat)
(get-model)
(exit)
