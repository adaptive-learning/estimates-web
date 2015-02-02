from learning.models import *
from django.http import HttpResponse, HttpResponseBadRequest
# from django.template import RequestContext, loader
from django.core.urlresolvers import reverse
from django.views.decorators.csrf import ensure_csrf_cookie, csrf_protect
from math import sqrt
import random, json, urllib2
from django.contrib.auth import get_user
from pint import UnitRegistry
from django.template.response import TemplateResponse


from django.views.generic.base import RedirectView
from django.views.generic import TemplateView, View
from django.views.generic.edit import FormView, CreateView 


def index(request):
    return TemplateResponse(request,'home/index.html')

def converter(amount,src,dst):
    Q_ = UnitRegistry(autoconvert_offset_to_baseunit = True).Quantity
    src = str(amount) + src
    return Q_(src).to(dst).magnitude

def arrayToType(type):
        if type == None :
            raise Exception('type in arrayToType is None')
        if type == 'e' or type == "c":
            return ["USD","PLN","HUF","CHF","GBP","RUB","CZK","EUR"]
        elif type == 'vol':
            return ["mm**3","cm**3","dm**3","m**3","km**3","ml","l","dl","hl"]
        elif type == 'surf' :
            return ["mm**2","cm**2","dm**2","m**2","km**2","are","acre"]
        elif type == 'len' :
            return ["mm","cm","dm","m","km","mile","inch","ft"]
        elif type == 'temp' :
            return ["kelvin","degF","degC"] 
        else :
            raise Exception('type is unknow command %s' %(type))
       
      
class CreateQuestion(CreateView):
        
    model = FloatModel
    fields = ['answer']    
            
    def randType(self,name):
        if name == None:
            raise Expcetion('name is unknow %s' %(type))
        
        if name == "all":
            name = random.choice(["phys","math","curr"])
        if name == 'phys':
            return random.choice(["vol","surf","len","temp"])
        elif name == 'math':
            return random.choice(["sqrt","equa"])
        elif name == 'curr':
            return random.choice(["e","c"])
            
    def decider(self,type):
        if type == 'equa' :
            self.model.result = eval(self.model.params.param1)
        elif type == 'sqrt' :
            self.model.result = round(sqrt(float(self.model.question)),2) 
        elif type == 'e' or type == 'c' :
            raw = urllib2.urlopen("https://query.yahooapis.com/v1/public/yql?q=select%20Rate%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22"+ self.model.params.param1 + self.model.params.param2 +"%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
            data = json.loads(raw.read())
            rate = data['query']['results']['rate']['Rate']
            
            self.model.result = round(float(rate) * float(self.model.question),2)
        elif type == 'vol' or type == 'surf' or type == 'len' or type == 'temp':
            array = arrayToType(type)
            src = self.model.params.param1
            dst = self.model.params.param2
            if src in array and dst in array:
                self.model.result = round(converter(self.model.question,src,dst),2)
            else:
                raise Exception("error unknow value of %s or %s"%(self.model.params.param1,self.model.params.param2))
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
        if self.request.user.is_authenticated():
            self.model.user = get_user(self.request)
        else :
            self.model.user = None
        self.model.answer = self.post.get('answer')
        self.model.time = self.post.get('time')
        
    def randArray(self,range,array,fr = None):
        if fr == None :
            fr = random.choice(array)          
        array.remove(fr)
        to = random.choice(array)
        q = random.randrange(range[0],range[1])
        return (fr,to,q)
    
    def get_context_data(self, **kwargs):
        ctx = super(CreateQuestion, self).get_context_data(**kwargs)
        self.type= self.kwargs.get('type',None)
        if self.type == None:
            raise Exception("type in CreateQuestion is None")
        splitted = self.type.split('-')
        print self.request.path
        if len(splitted) == 2 and splitted[1] == 'all':
            self.type = self.randType(splitted[0])
            ctx['action'] = self.request.path
        ctx['type'] = self.type
        return ctx
    
class AjaxableResponseMixin(CreateQuestion):
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
        
class CreateFrTo(AjaxableResponseMixin):
    default = None
    array = None
    range = None
    template_name = 'learning/frTo.html'
     
    def randArray(self,range,array,fr = None):
        fr,to,q = super(CreateFrTo,self).randArray(range,array,fr)
        if self.type != 'e' and self.type !='c':
            m = converter(q,fr,to)
            if round(m,2) == 0:
                print "fungujem"
                q *= pow(10,len(str(m))-2)
        return fr,to,q                      
                
    def init(self) :
        if self.type == None :
            raise Exception('type in CreateFrTo is None')
        self.range = (1,100)
        if self.type == 'e' :
            self.range = (10,120)
            self.default = 'EUR'
        elif self.type == 'c':
            self.range = (300,3000)
            self.default = 'CZK'
        elif self.type == 'temp' :
            self.range = (-40,40)
             
        if self.range == None :
            raise Exception('range is null %s' % (self.range))
         
        self.fr,self.to,self.question = self.randArray(self.range,arrayToType(self.type),self.default)
             
      
    def get_context_data(self, **kwargs):
        print kwargs
        ctx = super(CreateFrTo, self).get_context_data(**kwargs)
        self.init()
        ctx['fr'] = self.fr
        ctx['to'] = self.to
        ctx['question'] = self.question
        return ctx
    

        
class CreateMath(AjaxableResponseMixin):
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
            raise Exception("unknow type in CreateMath: %s" % (self.type))
            
        
    def get_context_data(self, **kwargs):
        ctx = super(CreateMath, self).get_context_data(**kwargs)
        
        self.init()
        ctx['question'] = self.question
        return ctx

    ############################################################################

    
 
