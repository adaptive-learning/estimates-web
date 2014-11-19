from django.shortcuts import render_to_response, render
from django.http import HttpResponse
from django.template import RequestContext, loader
from learning.models import MathExercise
import random, json
from django.core import serializers

def index(request):
    return render_to_response('home/index.html')

def MAssig(request):
    if request.method == 'post':
        return HttpResponse("Do something")
    assig = MathExercise()
    j = random.randint(2, 4)
    oper = [random.choice("+-*") for _ in range(j-1)]
    numbers = [random.randrange(100,200) for _ in range(j)]
    equation = ""
    e=str(numbers[0])
    equation = e
    counter = 1
    for char in oper:
        equation += char
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
