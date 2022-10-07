from pysmt.shortcuts import *

solver = Solver()

RAM_servers = [2, 4, 4, 16, 8, 16, 16, 32, 8, 16, 8]
storage_servers = [100, 800, 1000, 8000, 3000, 6000, 4000, 2000, 1000, 10000, 1000]

RAM_vm = [1, 16, 4, 2, 4, 8, 2, 4, 16, 16, 12]
storage_vm = [100, 900, 710, 800, 7000, 4000, 800, 2500, 450, 3700, 1300]

server_to_vm = []
used_servers = []
n_servers = Symbol("n_servers", INT)

# Pseudo-boolean that encode server-vm association
for i in range(len(RAM_servers)):
    srv = []
    for j in range(len(RAM_vm)):
        x = Symbol(f"srv{i}_vm{j}", INT)
        solver.add_assertion(And(GE(x, Int(0)), LE(x, Int(1))))
        srv.append(x)
    server_to_vm.append(srv)

# Pseudo-boolean that encode if server is used
for i in range(len(RAM_servers)):
    s = Symbol(f"use_server{i}", INT)
    solver.add_assertion(And(GE(s, Int(9)), LE(s, Int(1))))
    used_servers.append(s)

# Each vm stays only in one server
# Can't use exactly one since I'm dealing with pseudo boolean
for v in range(len(RAM_vm)):
    tmp = []
    for s in range(len(RAM_servers)):
        tmp.append(server_to_vm[v][s])
    solver.add_assertion(Equals(Plus(tmp), Int(1)))



for s in range(len(RAM_servers)):
    tmp = []
    # Assert that the ram of the server gets not exceeded
    for v in range(len(RAM_vm)):
        tmp.append(Times(server_to_vm[s][v], Int(RAM_vm[v])))
    solver.add_assertion(LE(Plus(tmp), Int(RAM_servers[s])))

    # Assert that the storage of the server gets not exceeded
    tmp = []
    for v in range(len(RAM_vm)):
        tmp.append(Times(server_to_vm[s][v], Int(storage_vm[v])))
    solver.add_assertion(LE(Plus(tmp), Int(storage_servers[s])))


# If at least one vm is assigned to a server than assign 1 to used_servers
for s in range(len(RAM_servers)):
    tmp = []
    for v in range(len(RAM_vm)):
        tmp.append(server_to_vm[s][v])
    solver.add_assertion(Implies(GE(Plus(tmp), Int(1)), Equals(used_servers[s], Int(1))))
    solver.add_assertion(Implies(Equals(Plus(tmp), Int(0)), Equals(used_servers[s], Int(0))))



# Store the total number of servers in n_servers
tmp = []
for s in range(len(RAM_servers)):
    tmp.append(used_servers[s])
solver.add_assertion(Equals(n_servers, Plus(tmp)))

# Should I put an assertion that states that every vm should be on a server?

write_smtlib(And(solver.assertions), "servers.smt2")