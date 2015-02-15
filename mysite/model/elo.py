import math

def elo(diff, prev, hard,K=0.2):
    print "diff",diff
    diff = 1-((diff/.05)*25)/100
    if diff < 0 :
        diff = 0
    elif diff > 1:
        diff = 1
    print diff,prev,hard
    e = -(prev-hard)
    s = float(pow(math.exp(1),e))
    m = 1/(1 + s) 
    print "m",m        
    return prev + K*(diff - m)


