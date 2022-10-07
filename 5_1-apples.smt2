(declare-const add_tree Int)

(define-fun tot_trees () Int (+ 50 add_tree))

(define-fun apt () Int (- 800 (* 10 add_tree)))

(maximize (* tot_trees apt) :id opt)


(check-sat)
(get-objectives)
(get-model)
(exit)