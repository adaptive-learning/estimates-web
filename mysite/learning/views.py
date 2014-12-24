from django.shortcuts import render_to_response, render, redirect
from django.http import HttpResponse
from django.template import RequestContext, loader
from django.views.decorators.csrf import ensure_csrf_cookie, csrf_protect
from learning.models import *
from math import sqrt
import random, json
import simplejson
import urllib2
from django.core import serializers

def index(request):
    return render_to_response('home/index.html')

@csrf_protect
def answeredMath(request):
    if request.method == "POST" :
        ans = request.POST.get('input')
        userId = request.POST.get('userId')
        model = MathExerciseModel.objects.get(id=request.POST.get('modelId'))
        model.result = eval(model.equation)
        model.answer = ans
        model.time = request.POST.get('time')
        model.save();
        diff = model.result - int(model.answer)
        
        
        return HttpResponse(str(diff) + "//" + str(model.result))

def MAssig(request):
    assig = MathExerciseModel()
    j = random.randint(2, 4)
    oper = [random.choice("+-*") for _ in range(j-1)]
    numbers = [random.randrange(100,200) for _ in range(j)]
    equation = str(numbers[0])
    counter = 1
    for char in oper:
        equation += ' ' +  char + ' '
        if (char == '*' ):
            numbers[counter] %= 15
        equation += str(numbers[counter])
        counter += 1
    
    assig.equation = equation
    assig.save(); 
    return render(request,'learning/math/assig.html', {'assig': assig})

def ansSqrt(request):
    if request.method == "POST" :
        userId = request.POST.get('userId')
        model = MathSqrtModel.objects.get(id=request.POST.get('modelId'))
        model.answer = request.POST.get('input')
        if ( model.oper == "1"):
            model.result = round(sqrt(model.question),2)
        else :
            model.result = pow(model.question, model.pow)
        diff = model.result - float(model.answer)
        model.time = request.POST.get('time')
        model.save()
        return HttpResponse(str(diff) + "//" + str(model.result))

def MSqrt(request):
    out = MathSqrtModel()
    out.oper = random.choice("12")
    
    
    if ( out.oper == '1'):
        out.question = random.randrange(1,256)
    else :
        out.question = random.randrange(10,16)
        out.pow = random.randrange(2,4)
        
    out.save()
    return render(request, 'learning/math/sqrt.html', {'assig':out})
    

def Currency(request,curr):
    # dolar,zloty,forint,frank, libra, rubel
    array = ["USD","PLN","HUF","CHF","GBP","RUB"]
    out = CurrencyModel()
    if curr == "CZK" :
        array.append("EUR")
        out.question = random.randrange(300,3000)
    else :
        array.append("CZK")
        out.question = random.randrange(10,120)
    out.to = random.choice(array)

    out.fr = curr
    out.save()
    return render(request,'learning/curr/assig.html',{'assig':out})
    

def ansCurr(request):
    if request.method == "POST" :
        userId = request.POST.get('userId')
        model = CurrencyModel.objects.get(id=request.POST.get('modelId'))
        model.answer = float(request.POST.get('input'))
        
        result = urllib2.urlopen("https://query.yahooapis.com/v1/public/yql?q=select%20Rate%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22"+ model.fr + model.to +"%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
        data = json.loads(result.read())
        rate = data['query']['results']['rate']['Rate']
        model.result = round(float(rate) * model.question,2)
        model.time = request.POST.get('time')

        diff = model.result - model.answer        
        model.save()
        return HttpResponse(str(diff) + "//" + str(model.result))

    
def physics(request,type):
    out =  PhysicsModel()
    if(type == 0):
        array = ["mm3","cm3","dm3","m3","km3","l","dcl","ml","hl"]
    elif(type == 1):
        array = ["mm2","cm2","m2","km2","ar","ha"]
    elif(type == 2):
        array = ["mm","cm","dm","m","km","mile"]
    elif(type == 3):
        array = ["fahrenheit","celsium"]
    out.fr = random.choice(array)
    array.delete(out.fr)
    out.to = random.choice(array)
    
    
    
    
