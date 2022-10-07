from pysmt.shortcuts import *

msat = Solver()

vars = {f"x{i}{j}": Symbol(f"x{i}{j}", BOOL) for i in range(1,9) for j in range(1,9)}

for i in range(1,9):
    msat.add_assertion(ExactlyOne([vars[f"x{i}{j}"] for j in range(1,9)]))

for j in range(1,9):
    msat.add_assertion(ExactlyOne([vars[f"x{i}{j}"] for i in range(1,9)]))


for k in range(2, 9):
    # msat.add_assertion(AtMostOne([vars[f"x{i}{j}"]for i in range(9-k, 9) for j in range(1, k+1)]))
    msat.add_assertion(AtMostOne([vars[f"x{(9-k)+(j-1)}{j}"]for j in range(1,k+1)]))
    if k!=8:
        # msat.add_assertion(AtMostOne([vars[f"x{i}{j}"]for i in range(1, k+1) for j in range(9-k, 9)]))
        msat.add_assertion(AtMostOne([vars[f"x{i}{(9-k)+(i-1)}"]for i in range(1, k+1)]))

for k in range(2, 9):
    # msat.add_assertion(AtMostOne([vars[f"x{i}{j}"] for i in range(1,k+1) for j in range(k,0,-1)]))
    msat.add_assertion(AtMostOne([vars[f"x{i}{k-(i-1)}"] for i in range(1,k+1)]))
    if k!=8:
        # msat.add_assertion(AtMostOne([vars[f"x{i}{j}"] for i in range(k,9) for j in range(8,k-1, -1)]))
        msat.add_assertion(AtMostOne([vars[f"x{i}{8-(i-k)}"] for i in range(k,9)]))




res = msat.solve()
print(res)
if res:
    solution = list()
    sat_model = {el[0].symbol_name():el[1] for el in msat.get_model()}
    for i in range(1, 9):
        for j in range(1, 9):
            if sat_model[f"x{i}{j}"] == Bool(True):
                print("Q ", end="")
            else:
                print("# ", end="")
        print("")