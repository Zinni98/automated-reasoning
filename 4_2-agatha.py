from pysmt.shortcuts import *


agatha = Int(0)
butler = Int (1)
charles = Int(2)

victim = agatha

solver = Solver(name='z3')

killer = Symbol("killer", INT)

fu = FunctionType(BOOL, [INT, INT])

hates = Symbol("hates", fu)
richer = Symbol("richer", fu)
i = Symbol('i', INT)
j = Symbol('j', INT)


# Hidden conditions
# 1. Nobody is richer than itself (non-reflexivity):
solver.add_assertion(ForAll([i], Not(Function(richer, [i,i]))))
# Probably this could work too:
# solver.add_assertion(Not(Function(richer, [agatha, agatha]))) and do this for every person

# 2. if i is richer than j than j is not richer than i (non-simmetry)
solver.add_assertion(ForAll([i,j], Implies(Function(richer, [i, j]),
                                          Not(Function(richer, [j, i])))))

# The killer is one of the three
solver.add_assertion(And(GE(killer, agatha), LE(killer, charles)))

# A killer always hates his victim
solver.add_assertion(Function(hates, [killer, victim]))

# A killer is never richer than its victim
solver.add_assertion(Not(Function(richer, [killer, victim])))

# Charles hates no one that aunt agatha hates
solver.add_assertion(ForAll([i], Implies(Function(hates, [agatha, i]),
                                        Not(Function(hates, [charles, i])))))

# Agatha hates everybody except the butler:
solver.add_assertion(ForAll([i], Implies(NotEquals(i, butler),
                                        Function(hates, [agatha, i]))))

# The butler hates everyone no richer than aunt-agatha
solver.add_assertion(ForAll([i], Implies(Function(richer, [agatha, i]),
                                        Function(hates, [butler, i]))))

# The butler hates every-one aunt agatha hates
solver.add_assertion(ForAll([i], Implies(Function(hates, [agatha, i]),
                                        Function(hates, [butler, i]))))

# No one hates everyone (ASK!!!!!!!!!!!!!!!!)
solver.add_assertion(ForAll([i], Plus([Ite(Function(hates, [i,Int(j)]),Int(1),Int(0)) for j in range(3)]) <= Int(2)))

num_solutions = 0

while solver.solve():
    num_solutions += 1
    sat_model = {el[0].symbol_name(): el[1] for el in solver.get_model()}
    print(sat_model)
    solver.add_assertion(Not(Equals(killer, sat_model['killer'])))

print(f"num_solutions: {num_solutions}")
