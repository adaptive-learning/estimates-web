import math

def myModel(score, skill, diff, updateCount, time = None):
    sc = predict_score(skill,diff,time)
    newHard = diff + uncertain_function(updateCount)*(sc - score)
    if score >= sc:
        K=3.4;
        uS = skill + K*(score-sc)
    else :
        K = -0.3
        uS = skill + K*(sc-score)
    return (newHard,uS)

def predict_score(skill,diff, time=None):
    if time != None:
        time = math.log(float(time))
    else: time = 0
    e = -(skill+time-diff)
    return sigmoid(e)

def uncertain_function(n,a = 1.0,b=.06):
    return a / (1+b*n)
    
def get_score(approximation, possCorrect = 10, step = 0.04):
    score =  1-((approximation/(step * possCorrect)))
    if score<0: score = 0
    return score

def sigmoid(x):
    s = float(1 + math.exp(x))
    return 1/s     
