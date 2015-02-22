import math

def elo(diff, prev, hard, time = None):
    K = 1/float((math.log(time)/math.log(2))) if time != None else 0.2
    print "K",K
    diff = 1-((diff/.05)*25)/100
    if diff < 0 :
        diff = 0
    elif diff > 1:
        diff = 1
    
    print "diff",diff
    print diff,prev,hard

    return prev + K*(diff - Pcorrect(prev,hard))

def Pcorrect(prev,hard):
    e = -(prev-hard)
    s = float(pow(math.exp(1),e))
    return 1/(1 + s) 