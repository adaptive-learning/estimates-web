import math

def myModel(score, skill, diff, updateCount, time = None):
    print "score",score
    sc = predict_score(skill,diff,time)

    print "score",sc

    newHard = diff + uncertain_function(updateCount)*(sc - score)

    print "new Hard",newHard

    if score >= sc:
        K=3.4;
        uS = skill + K*(score-sc)
    else :
        K = -0.3
        uS = skill + K*(sc-score)
    return (newHard,uS)

def predict_score(skill,diff, time=None):
    if time == None:
        time = 0
    else : time = float(time) 
    e = -(skill+ln(time)-diff)
    s = float(1 + math.exp(e))
    return 1/s 

def ln(x):
    return math.log1p(x)

def uncertain_function(n,a = 1.0,b=.06):
    return a / (1+b*n)
    
def get_score(approximation, possCorrect = 5, step = 0.04):
    possCorrect = 2*possCorrect
    return 1-((approximation/step)*(100/possCorrect))/100
