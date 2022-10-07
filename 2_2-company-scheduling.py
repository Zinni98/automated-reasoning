from pysmt.shortcuts import *

day_company = {f"dc{i}{j}": Symbol(f"dc{i}{j}", BOOL) for i in range(0,4) for j in "alsi"}
day_role = {f"dr{i}{j}": Symbol(f"dr{i}{j}", BOOL) for i in range(0,4) for j in "cgrm"}

var = {**day_company, **day_role}

msat = Solver()

# The Alpha Plus interview is 2 days before the meeting for the copywriter position.
msat.add_assertion(Or(And(var["dc0a"], var["dr2c"]), And(var["dc1a"], var["dr3c"])))

#The meeting for the graphic design position is some time after the Sancode interview
msat.add_assertion(And(Not(var["dr0g"]), Not(var["dc3s"]), Not(And(var["dr1g"], var["dc3s"]))))

# Of the interview for the sales rep position and the Laneplex interview, one is on August 23rd and the other is on August 20th.
msat.add_assertion(Or(And(var["dr0r"], var["dc3l"]), And(var["dc0l"], var["dr3r"])))

# The Streeter Inc. interview is 2 days after the Alpha Plus interview.
msat.add_assertion(Or(And(var["dc0a"], var["dc2i"]), And(var["dc1a"], var["dc3i"])))

# On the 23rd there is no interview for social media roles
msat.add_assertion(Not(var["dr3m"]))


# Only one company for each day
for i in range(0, 4):
    msat.add_assertion(ExactlyOne([var[f"dc{i}{j}"] for j in "alsi"]))

# Only one role for each day
for i in range(0, 4):
    msat.add_assertion(ExactlyOne([var[f"dr{i}{j}"] for j in "cgrm"]))

# Each company associated exactly to one day
for i in "alsi":
    msat.add_assertion(ExactlyOne([var[f"dc{j}{i}"] for j in range(0, 4)]))

# Each role associated exactly to one day
for i in "cgrm":
    msat.add_assertion(ExactlyOne([var[f"dr{j}{i}"] for j in range(0, 4)]))

final_answer = ["20th: ", "21st: ", "22nd: ", "23rd: "]
companies = {"a": "Alpha Plus", "l":"Laneplex", "s": "Sancode", "i": "Streeter Inc."}
roles = {"c": "copywriter", 'g':'graphic design', 'r':'sales rep', 'm': 'social media'}

res = msat.solve()
if res:
	sat_model = {el[0].symbol_name():el[1] for el in msat.get_model()}
	for i in range(0,4):
		for j in "alsi":
			if sat_model["dc{}{}".format(i,j)] == Bool(True):
				final_answer[i] = final_answer[i] + companies[j] + " - "
		for j in "cgrm":
			if sat_model["dr{}{}".format(i,j)] == Bool(True):
				final_answer[i] = final_answer[i] + roles[j]
	print("\n".join(final_answer))
else:
	print("UNSAT")


