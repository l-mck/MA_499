"""
in: set s, graph G
out: boolean, is s zf set of G
com: worst: blue = end point, G = path => O(n^2)
     best: blue = all but one, G = any graph => O(n)
"""
def is_zf(blue, G):
    forced = True
        # initialize value "forced"
    
    while set(blue) != set(G.vertices()) and forced == True:
        # while there are white vertices and at least one force occurred on prior iteration
        # - if there are no white vertices, set is zf
        # - if no forces occurred on the last iteration, it is impossible for a force to occur
        #    this iteration, so break to prevent infinite loop
        forced = False
            # set forced equal to false
        for v in blue:
            # for each blue vertex v
            white_neighbors = [u for u in G.neighbors(v,False) if u not in blue]
                # calculate its white neighbors
            if len(white_neighbors) == 1:
                # if v has 1 white neighbor u
                blue.append(white_neighbors[0])
                forced == True
                    # v forces u blue
                    
    if set(blue) != set(G.vertices()): return False 
    else: return True
