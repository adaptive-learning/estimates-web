import math

def myModel(ans, prev, hard, updateCount, possCorrect,step,time = None):
    ans = 1-((ans/step)*(100/possCorrect))/100
    if ans < 0 :
        ans = 0
    elif ans > 1:
        ans = 1
    
    sc = score(prev,hard,time)
    newHard = hard + uncertain_function(updateCount)*(sc - ans)
    if ans >= hard:
        K=3.4;
        uS = prev + K*(ans-sc)
    else :
        K = -0.3
        uS = prev + K*(sc-ans)
    if uS > 1: uS = 1
    elif uS < 0: uS = 0  
    return (newHard,uS)

def score(prev,hard, time=None):
    if time == None:
        time = 0
    else : time = float(time) 
    e = -(prev+ln(time)-hard)
    s = float(pow(math.exp(1),e))
    return 1/(1 + s) 

def ln(x):
    return math.log1p(x)

def uncertain_function(n,a = 1.0,b=.06):
    return a / (1+b*n)
    

