from itertools import combinations 

"""
in: list list, int pop_amt
out: void
func: removes the last pop_amt elements (ex. last 5 elements)
- used to reset modified blue set from is_zf
com: O(pop_amt)
"""
def reset(list,pop_amt):
    while pop_amt > 0:
        list.pop(-1)
        pop_amt -= 1

"""
in: list blue, int bsize (size of blue), graph G
out: boolean
func: is blue zf set of G
com: worst: O(n^3)
"""
def is_zf(blue, bsize, G):
    forced = True
    numForces = 0
    
    while forced == True:
        # while at least one force occurred on prior iteration
        forced = False
            # set forced equal to false
        for v in blue:
            # for each blue vertex v
            white_neighbors = [u for u in G.neighbors(v,False) if u not in blue]
                # calculate its white neighbors
                # for u O(n), not in blue O(n)
            if len(white_neighbors) == 1:
                # if v has 1 white neighbor u
                blue.append(white_neighbors[0])
                forced = True
                    # v forces u blue
                numForces += 1
                    # increment counter
                    
    reset(blue,numForces)
        # reset blue O(counter)
    if numForces == len(G) - bsize: return True 
        # if num of forces == num of white vertices, blue is zf
    else: return False

"""
in: set blue, int bsize, graph G
out: boolean
func: is blue minimal
com: runs n times, is_zf is O(n^3) => O(n^4)
"""

def is_minimal(blue, bsize, G):
    result = True
        # init result to True
    while result == True and bsize > 0:
        # run unless result turns to false or bsize decrements to 0
        v = blue.pop()
            # remove head of set and assign to v O(1)
        if is_zf(list(blue),len(blue),G): result = False
            # if blue is zf, result is now false O(??)
        blue.add(v)
            # reset blue
        bsize -= 1
            # decrement counter
    return result

"""
in: list pset, graph G
out: tbd
func: finds z and min zf set
com: tbd
"""
def find_z(pset, G): 
    # initialize return values to largest z and zset
    z = len(G.vertices())
    zset = G.vertices()
    
    for s in pset:
        if len(s) > 1:
            """for trees, no zset can be just 1 vertex"""
            if is_zf(s, len(s), G):
                # if it is zf, we found min bc pset ordered by length
                z = len(s)
                zset = s
                break
    
    return [z,zset]
        
"""
in: list pset, graph G
out: tbd
func: finds zbar and maximum minimal zf set
com: tbd
"""
def find_zbar(pset, G):
    # initialize return values to smallest z and zset
    zbar = 0
    zbarset = []
    
    while len(pset) > 0:
        # while still subsets to check
        s = pset.pop(-1)
            # check last subset
        if is_minimal(set(s), len(s), G) and is_zf(s,len(s),G):
                # if it is minimal zf, we found largest bc pset ordered by length
                zbar = len(s)
                zbarset = s
                break
                    
        #TEST IF WE CAN REMOVE ELEMENTS OF PSET AND DECREMENT THAT WAY 
        #psize -= 1
            # decrement amt of subsets left to check
        
    return [zbar,zbarset]
    
"""
in: graph G
out: int zbar-z
func: calculates gap between zf num and max minimal zf set
com: tbd
"""
def gap(G):
    pset = []
        # set of tuples of all subsets
    supersets = []
        # set of tuples of supersets to skip
    z = len(G.vertices())
        # init zf num to full graph
    zset = []
        # init min zf set
        
    # adapted from GFG "??"
    pset = [list(combinations(G.vertices(), r)) for r in range(1, len(G.vertices()) + 1)]  
    pset = [list(sublist) for g in pset for sublist in g] 
        
    # finds min zf num and min zf set
    [z,zset] = find_z(pset, G)

    # finds zbar num and max minimal zf sets
    [zbar, zbarset] = find_zbar(pset,G)
    
    return [zbar-z,str(zbarset) + " - " + str(zset) + " = " + str(zbar-z)]


from sage.graphs.trees import TreeIterator

def largest_gap(n):
    maxgap = [0,""]
    for t in TreeIterator(n):
        tval = gap(t)
        if tval[0] > maxgap[0]:
            maxgap[0] = tval[0]
            maxgap[1] = tval[1]
            maxtree = t
        
    maxtree.plot().show()
    print(maxgap[1])
    
def all_gaps(n):
    for t in TreeIterator(n):
        t.plot().show()
        print(gap(t)[1])
