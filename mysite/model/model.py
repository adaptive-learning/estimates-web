import math

def myModel(ans, prev, hard, possCorrect,step,time = None):
#     K = 1/float((math.log(time)/math.log(2))) if time != None else 0.2
#     print "K",K
    ans = 1-((ans/step)*(100/possCorrect))/100
    if ans < 0 :
        ans = 0
    elif ans > 1:
        ans = 1
    
    sc = score(prev,hard)
    newHard = hard + 0.2*(sc - ans)
    if ans >= hard:
        K=3.4;
        uS = prev + K*(ans-sc)
    else :
        K = -0.3
        uS = prev + K*(sc-ans)
    if uS > 1: uS = 1
    elif uS < 0: uS = 0  
    return (newHard,uS)

def score(prev,hard, time = 0):
    e = -(prev+time-hard)
    s = float(pow(math.exp(1),e))
    return 1/(1 + s) 

