from django.shortcuts import render_to_response, render, redirect
from django.http import HttpResponse
from django.template import RequestContext, loader
from learning.models import *
import random, json
import simplejson
import urllib2
from django.core import serializers

def index(request):
    return render_to_response('home/index.html')

def answeredMath(request):
    if request.method == "POST" :
        answer = request.POST["ans"]
        response = MAssig(request)
        return redirect('/math/assig')

def MAssig(request):
    assig = MathExerciseModel()
    j = random.randint(2, 4)
    oper = [random.choice("+-*") for _ in range(j-1)]
    numbers = [random.randrange(100,200) for _ in range(j)]
    equation = str(numbers[0])
    counter = 1
    for char in oper:
        equation += char
        if (char == '*'):
            numbers[counter] %= 15
        equation += str(numbers[counter])
        counter += 1
    assig.result = eval(equation)

    
    data = json.loads(serializers.serialize('json', [assig,]))
    d = {}
    d['results'] = data
    d['num'] = numbers;
    d['o'] = oper;
                        
    data = json.dumps(d)
    return render(request,'learning/math/assig.html', {'assig': data})

# def Msqrt(request):
#     numbers = [random.randrange(100,200) for _ in range(j)]

def Currency(request,curr):
#    dolar,zloty,forint,frank, libra, rubel
    array = ["USD","PLN","HUF","CHF","GBP","RUB"]
    rand = random.choice(array)
    if curr == "CZK" : 
        val = random.randrange(300,3000)
    else :
        val = random.randrange(10,120)
    res = urllib2.urlopen("http://rate-exchange.appspot.com/currency?from="+curr+"&amp;to="+rand+"&amp;q=" + str(val))
    data = json.loads(res.read())
    
    out = CurrencyModel()
    out.result = round(float(data['v']),2)
    out.question = val
    out.fr = curr
    out.to = rand
    
    
    return render(request,'learning/curr/assig.html',{'output':out})

def answeredCurr(request):
    if request.method == "POST" :
        answer = request.POST["ans"]
        response = MAssig(request)
        return redirect('/curr/e')
    
