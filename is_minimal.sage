"""
in: list blue (zf), graph G
out: boolean, is blue minimal
com: runs blue.vertices() times, is_zf is O(n) or O(n^2)
    => worst is O(n^3)
"""
def is_minimal(blue, G):
    for v in blue:
        # for each blue vertex v
        blue.remove(v)
        if is_zf(blue,G): return False
            # if given set w/o v is zf, not minimal
        else: blue.append(v)
            # otherwise, re-add v and try next blue vertex
    return True
        # if never return false, must be minimal
