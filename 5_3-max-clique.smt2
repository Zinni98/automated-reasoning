(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)
(declare-const d Bool)

(assert (not (and b c)))

(assert-soft a :weight 1 :id penalty)
(assert-soft b :weight 1 :id penalty)
(assert-soft c :weight 1 :id penalty)
(assert-soft d :weight 1 :id penalty)


(minimize penalty)
(check-allsat (a b c d))
(get-objectives)
(get-model)
(exit)