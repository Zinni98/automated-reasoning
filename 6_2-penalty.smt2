(set-option :produce-models true)

(declare-const aa Int 4)
(declare-const ab Int 3)
(declare-const ac Int 2)
(declare-const ad Int 5)
(declare-const ba Int (- 10))
(declare-const bb Int 2)
(declare-const bc Int 0)
(declare-const bd Int (- 1))
(declare-const ca Int 7)
(declare-const cb Int 5)
(declare-const cc Int 2)
(declare-const cd Int 3)
(declare-const da Int 0)
(declare-const db Int 8)
(declare-const dc Int (- 4))
(declare-const dd Int (-5))

(declare-const ra Int)
(assert (or (= ra aa) (= ra ab) (= ra ac) (= ra ad)))
(declare-const rb Int)
(assert (or (= rb ba) (= rb bb) (= rb bc) (= rb bd)))
(declare-const rc Int)
(assert (or (= rc ca) (= rc cb) (= rc cc) (= rc cd)))
(declare-const rd Int)
(assert (or (= rd da) (= rd db) (= rd dc) (rd dd)))

(minmax ra rb rc rd)




(check-sat)
(get-model)
(exit)