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
    # dolar,zloty,forint,frank, libra, rubel
    array = ["USD","PLN","HUF","CHF","GBP","RUB"]
    if curr == "CZK" :
        array.append("EUR")
        val = random.randrange(300,3000)
    else :
        array.append("CZK")
        val = random.randrange(10,120)
    rand = random.choice(array)
    result = urllib2.urlopen("https://query.yahooapis.com/v1/public/yql?q=select%20Rate%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22"+ curr + rand +"%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
    data = json.loads(result.read())
    rate = data['query']['results']['rate']['Rate']
    # ft = random.choice("ft")
    
    # if(ft == 'f'):
    out = CurrencyModel()
    out.question = val
    out.result = round(float(rate) * val,2)
    out.fr = curr
    out.rate = rate
    out.to = rand
    return render(request,'learning/curr/assig.html',{'output':out})


def answeredCurr(request):
    if request.method == "POST" :
        answer = request.POST["ans"]
        response = MAssig(request)
        return redirect('/curr/e')
    
