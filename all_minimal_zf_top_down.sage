"""
in: graph G
out: list of lists of all minimal zf sets of G
"""
def all_minimal_zf(G):
    results = []
    generator(G, -1, G.vertices(), results)
    return results
    
"""
in: graph G, int r (removed vertex), list s (of vertices), list of lists results
out: void, updates results recursively
"""
def generator(s, G)
    results = []
    while(s.length != 0):
        if is_zf(s,G):
            if is_minimal(s,G): results.append(s)
            else: 

    if is_zf(s,G):
        if is_minimal(s,G): results.append(s)
        else: for v in s: generator(G,v,s.remove(v),results)
    else: end
    



def generator(G, r, s, results):
    if is_zf(s,G):
        for v in s:
            s_edit = s.copy()
            print("s_edit: " + str(s_edit))
            s_edit.remove(v)
            print("v: " + str(v))
            print("s-v: " + str(s_edit))
            generator(G,v,s_edit,results)
        # if the set is zf, try removing each vertex individually
    else: results.append(s.append(r))
        # if s is not zf (i.e after removing r, its no longer zf)
        #    add to s with r to results
