(set-option :produce-models true)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const e Int)


(assert (and (<= a 5) (>= a 1)))
(assert (and (<= b 5) (>= b 1)))
(assert (and (<= c 5) (>= c 1)))
(assert (and (<= d 5) (>= d 1)))
(assert (and (<= e 5) (>= e 1)))

(assert (distinct a b c d e))

(assert (< d a))
(assert (and (< c b) (< e b)))
(assert (or (< b e) (< d e)))
(assert (< a c))

(check-sat)
(get-model)
(exit)