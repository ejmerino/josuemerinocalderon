from collections import defaultdict
from itertools import combinations

def list_duplicates(seq):
    tally = defaultdict(list)
    for i,item in enumerate(seq):
        tally[item].append(i)
    return ((key,locs) for key,locs in tally.items() if len(locs)>1)

def sum_digits(n):
    s = 0
    while n:
        s += n % 10
        n //= 10
    return s

def solution(A):
    # write your code in Python 3.6
    sums = [sum_digits(i) for i in A]

    if len(sums) == len(set(sums)):
        return -1
    res = list()
    for _, v in list_duplicates(sums):
        for w in list(combinations(v, 2)):
            #print(A[w[0]], w[1])
            res.append(A[w[0]] + A[w[1]])

    return max(res)


    

if __name__ == "__main__":
    
    S=[42,33,60]
    
    i = solution(S)

    print(i)