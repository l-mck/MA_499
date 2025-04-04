"""
in: list s, graph G
out: boolean, is s zf set of G
com: worst: O(n^3)
"""
def is_zf(blue, bsize, G):
    forced = True
    counter = 0
    
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
                counter += 1
                    # increment counter
                    
    
    reset(blue,counter)
        # reset blue O(counter)
    if counter == len(G) - bsize: return True 
        # if num of forces == num of white vertices, blue is zf
    else: return False
