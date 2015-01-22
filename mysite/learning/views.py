# from django.shortcuts import render_to_response, 
from django.http import HttpResponse, HttpResponseBadRequest
from django.template import RequestContext, loader
from django.views.decorators.csrf import ensure_csrf_cookie, csrf_protect
from learning.models import *
from math import sqrt
from forms import FloatForm
import random, json
import simplejson
import urllib2
from django.core import serializers
from django.template.response import TemplateResponse
#  some_app/views.py


from django.views.generic import TemplateView, View
# from learning.forms import IntForm
from django.views.generic.edit import FormView, CreateView 


from django_enumfield import enum

class QType(enum.Enum):
    EQUA = 0
    VOL = 1
    EUR = 2
    CZK = 3
    CAP = 4
    AREA = 5
    DIST = 6
    TEMP = 7

def index(request):
    return TemplateResponse(request,'home/index.html')

    
class AjaxableResponseMixin(object):
    
    def decider(self,type):
#         type = 'e'
        if type == 'equa' :
            print self.model.params.param1
            self.model.result = eval(self.model.params.param1)
        elif type == 'sqrt' :
            self.model.result = round(sqrt(float(self.model.question)),2) 
        elif type == 'e' or type == 'c' :
            raw = urllib2.urlopen("https://query.yahooapis.com/v1/public/yql?q=select%20Rate%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22"+ self.model.params.param1 + self.model.params.param2 +"%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
            data = json.loads(raw.read())
            rate = data['query']['results']['rate']['Rate']
            
            self.model.result = round(float(rate) * float(self.model.question),2)
        else :
            raise Exception('type is unknow command %s' %s(type))
        
        
        
    def parseToModel(self):
        js = json.loads(self.post.get('data'))
        try: 
            p = Params.objects.get(param1 = js['fr'], param2 = str(js['to']))
        except Params.DoesNotExist:

            p = Params(param1 = js['fr'], param2 = str(js['to']))
            p.save()
        try:
            t = Type.objects.get(type=js['type'])
        except Type.DoesNotExist:
            t = Type(type=js['type'])
            t.save()
            
        self.model.question = js['question']
        self.model.type = t
        self.model.params = p
        self.model.answer = self.post.get('answer')
        self.model.time = self.post.get('time')

    def form_invalid(self, form):
        if self.request.is_ajax():
            return HttpResponseBadRequest(json.dumps(form.errors))

    def form_valid(self, form):
        if self.request.is_ajax():
            self.model = FloatModel()
            self.post = self.request.POST
            self.parseToModel()
            self.decider(self.model.type.type)
            self.model.save()
            diff = self.model.result - float(self.model.answer)
            return HttpResponse(str(diff) + '//' + str(self.model.result))
#         ToDo elif
    
class CreateQuestion(AjaxableResponseMixin,CreateView):   
    
    model = FloatModel
    fields = ['answer']
    def get_context_data(self, **kwargs):
        ctx = super(CreateQuestion, self).get_context_data(**kwargs)
        self.type= self.kwargs.get('type',None)
        if self.type == None:
            raise Exception("type in CreateQuestion is None")
        ctx['type'] = self.type
        return ctx
    def randArray(self,range,array,fr = None):
        if fr == None :
            fr = random.choice(array)            
        array.remove(fr)
        to = random.choice(array)
        q = random.randrange(range[0],range[1])
        return (fr,to,q)
    

        
class CreateFrTo(CreateQuestion):
    default = None
    array = None
    range = None
    template_name = 'learning/curr/assig.html'
    def init(self) :
        if self.type == None :
            raise Exception('type in CreateFrTo is None')
        if self.type == 'e' :
            self.array = ["USD","PLN","HUF","CHF","GBP","RUB","CZK","EUR"]
            self.range = (10,120)
            self.default = 'EUR'
        elif self.type == 'c':
            self.array = ["USD","PLN","HUF","CHF","GBP","RUB","CZK","EUR"]
            self.range = (300,3000)
            self.default = 'CZK'
        elif(self.type == 'fd'):
            self.array = ["mm3","cm3","dm3","m3","km3","l","dcl","ml","hl"]
        elif(self.type == 1):
            self.array = ["mm2","cm2","m2","km2","ar","ha"]
        elif(self.type == 2):
            self.array = ["mm","cm","dm","m","km","mile"]
        elif(self.type == 3):
            self.array = ["fahrenheit","celsium"]
        else :
            raise Exception('type is unknow command %s' %s(self.type))
            
        if self.array == None or self.range == None :
            raise Exception('array or range is null %s %s' % (self.array, self.range))
        
        if self.default == None:
            self.fr,self.to,self.question = self.randArray(self.range,self.array)
        else:
            self.fr,self.to,self.question = self.randArray(self.range,self.array,self.default)
#         ToDo
#         find fr to in TypeModel and add like Foreign Key
#         find if there are public / private and get   
     
    def get_context_data(self, **kwargs):
        print "am i"
        ctx = super(CreateFrTo, self).get_context_data(**kwargs)
        self.init()
        ctx['fr'] = self.fr
        ctx['to'] = self.to
        ctx['question'] = self.question
        return ctx
    

        
class CreateMath(CreateQuestion):
    template_name = 'learning/math/sqrt.html'
    def createEquation(self,oper,numEle,rangeEle):
        j = random.randint(numEle[0], numEle[1])
        oper = [random.choice(oper) for _ in range(j-1)]
        numbers = [random.randrange(rangeEle[0],rangeEle[1]) for _ in range(j)]
        equation = str(numbers[0])
        counter = 1
        for char in oper:
            equation += ' ' +  char + ' '
            if (char == '*' ):
                numbers[counter] %= 15
            equation += str(numbers[counter])
            counter += 1
        return equation
            
    def init(self):
        if self.type == 'equa':
            self.question = self.createEquation("+-*",(2,4),(100,300))
            self.template_name = 'learning/math/equa.html'
        elif self.type == 'sqrt':
            self.question = random.randrange(1,256)
        else:
            raise Exception("unknow type in CreateMath %s" %s (self.type))
            
        
    def get_context_data(self, **kwargs):
        ctx = super(CreateMath, self).get_context_data(**kwargs)
        
        self.init()
        print self.question
        ctx['question'] = self.question
        return ctx
    
    ############################################################################

    
 
