(set-option :opt.priority box)

(define-const aa Int 4)
(define-const ab Int 3)
(define-const ac Int 2)
(define-const ad Int 5)

(define-const ba Int (- 10))
(define-const bb Int 2)
(define-const bc Int 0)
(define-const bd Int (- 1))

(define-const ca Int 7)
(define-const cb Int 5)
(define-const cc Int 2)
(define-const cd Int 3)

(define-const da Int 0)
(define-const db Int 8)
(define-const dc Int (- 4))
(define-const dd Int (- 5))


(declare-const ra Int)
(assert (or (= ra aa) (= ra ab) (= ra ac) (= ra ad)))

(declare-const rb Int)
(assert (or (= rb ba) (= rb bb) (= rb bc) (= rb bd)))

(declare-const rc Int)
(assert (or (= rc ca) (= rc cb) (= rc cc) (= rc cd)))

(declare-const rd Int)
(assert (or (= rd da) (= rd db) (= rd dc) (= rd dd)))

(minmax ra rb rc rd)


(check-sat)
(get-model)
(exit)

