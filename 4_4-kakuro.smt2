(set-option :produce-models true)

(declare-const a11 Int)
(declare-const a12 Int)
(declare-const a13 Int)

(declare-const a21 Int)
(declare-const a22 Int)
(declare-const a23 Int)

(declare-const a31 Int)
(declare-const a32 Int)

(declare-const a42 Int)
(declare-const a43 Int)
(declare-const a44 Int)

(declare-const a52 Int)
(declare-const a53 Int)
(declare-const a54 Int)

(define-fun good ((a Int)) Bool (ite (and (<= a 9) (>= a 1)) true false))

; All numbers between 0 and 9
(assert (good a11))
(assert (good a12))
(assert (good a13))

(assert (good a21))
(assert (good a22))
(assert (good a23))

(assert (good a31))
(assert (good a32))

(assert (good a42))
(assert (good a43))
(assert (good a44))

(assert (good a52))
(assert (good a53))
(assert (good a54))

; Rows
(assert (= (+ a11 a12 a13) 9))
(assert (distinct a11 a12 a13))

(assert (= (+ a21 a22 a23) 13))
(assert (distinct a21 a22 a23))

(assert (= (+ a31 a32) 13))
(assert (distinct a31 a32))

(assert (= (+ a42 a43 a44) 7))
(assert (distinct a42 a43 a44))

(assert (= (+ a52 a53 a54) 19))
(assert (distinct a52 a53 a54))

; Columns

(assert (= (+ a11 a21 a31) 9))
(assert (distinct a11 a21 a31))

(assert (= (+ a12 a22 a32 a42 a52) 34))
(assert (distinct a12 a22 a32 a42 a52))

(assert (= (+ a13 a23) 4))
(assert (distinct a13 a23))

(assert (= (+ a43 a53) 11))
(assert (distinct a13 a23))

(assert (= (+ a44 a54) 3))
(assert (distinct a44 a54))


(check-sat)
(get-model)
(exit)




