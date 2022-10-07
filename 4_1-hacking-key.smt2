(set-option :produce-models true)

(declare-const a (_ BitVec 32))
(declare-const b (_ BitVec 32))
(declare-const c (_ BitVec 32))


(assert (= (bvurem a ((_ to_bv 32) 5)) ((_ to_bv 32) 0))))
(assert (= (bvor a b) ((_ to_bv 32) 2022)))
(assert (= (bvsub a b) ((_ to_bv 32) 1000)))
(assert (= c (bvudiv (bvadd a b) ((_ to_bv 32) 2))))
(assert (bvult c #x76543210))

(check-sat)
(get-model)
(exit)