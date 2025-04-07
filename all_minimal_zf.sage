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

def find_z(s, ssize, G):  
    maxz = G.len()-1
    
    while ssize > 0:
        # while still subsets to check
        subset = s.pop()
            # check first subset
        if subset.len() < maxz:
            if is_zf(subset, subset.len(), G):
                # if it is zf

                # TODO: remove all supersets of s
                maxz = subset.len()
                    # update maxz
        ssize -= 1
            # decrement amt of subsets left to check
        
    return [maxz,G]
        # return max size if no return made prior
        # FIX, SHOULD RETURN G-v NOT G
        

def find_zbar(s,G):
    print("made it!")
    return 100
    
  
    

def gap(G):
    pset = []
        # set of tuples of all subsets
    supersets = []
        # set of tuples of supersets to skip
    z = len(G.vertices())
        # init zf num to full graph
    zset = []
        # init min zf set
        
    # adapted from GFG "Print All Sublists of a List in Python" 2/8/25
    pset = [list(combinations(G.vertices(), r)) for r in range(1, len(G.vertices()) + 1)]  
    pset = [list(sublist) for g in pset for sublist in g] 
    
    
    return pset
            
    
    #[z,zset] = find_z(s, s.cardinality(), G)
        # finds min zf num and min zf set
    
    # REMOVE ALL SUPERSETS OF ZSET
    
    #zbar = find_zbar(s,G)
        # finds max minimal zf set size
    #return zbar-z
        # returns difference
    



g = graphs.BalancedTree(2,2)
g.plot().show()
s = gap(g)
print(s)
