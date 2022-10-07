(set-option :produce-models true)

(declare-const a1 Bool)
(declare-const a2 Bool)
(declare-const a3 Bool)
(declare-const a4 Bool)

(declare-const b1 Bool)
(declare-const b2 Bool)
(declare-const b3 Bool)
(declare-const b4 Bool)

(declare-const c1 Bool)
(declare-const c2 Bool)
(declare-const c3 Bool)
(declare-const c4 Bool)

(declare-const d1 Bool)
(declare-const d2 Bool)
(declare-const d3 Bool)
(declare-const d4 Bool)


(assert (xor a1 d2))
(assert (xor a2 d3))
(assert (xor d1 a2))
(assert (xor d2 a3))

(assert (xor b1 c2))
(assert (xor b2 c3))
(assert (xor c1 b2))
(assert (xor c2 b3))

(assert (=> a1 (not (or a2 a3 a4))))
(assert (=> a2 (not (or a1 a3 a4))))
(assert (=> a3 (not (or a2 a1 a4))))
(assert (=> a4 (not (or a2 a3 a1))))

(assert (=> b1 (not (or b2 b3 b4))))
(assert (=> b2 (not (or b1 b3 b4))))
(assert (=> b3 (not (or b2 b1 b4))))
(assert (=> b4 (not (or b2 b3 b1))))

(assert (=> c1 (not (or c2 c3 c4))))
(assert (=> c2 (not (or c1 c3 c4))))
(assert (=> c3 (not (or c2 c1 c4))))
(assert (=> c4 (not (or c2 c3 c1))))

(assert (=> d1 (not (or d2 d3 d4))))
(assert (=> d2 (not (or d1 d3 d4))))
(assert (=> d3 (not (or d2 d1 d4))))
(assert (=> d4 (not (or d2 d3 d1))))

(assert (and (or a1 a2 a3 a4) (or b1 b2 b3 b4) (or c1 c2 c3 c4) (or d1 d2 d3 d4)))


(check-allsat (a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4 d1 d2 d3 d4))

(exit)