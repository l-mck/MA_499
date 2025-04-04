"""
in: set blue, int bsize, graph G
out: boolean, is blue minimal
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
