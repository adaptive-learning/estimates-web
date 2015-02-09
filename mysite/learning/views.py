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
from django.shortcuts import redirect

from django.views.generic.base import RedirectView
from django.views.generic import TemplateView, View
from django.views.generic.edit import FormView, CreateView 


def index(request):
    return TemplateResponse(request, 'home/index.html')

def converter(amount, src, dst):
    Q_ = UnitRegistry(autoconvert_offset_to_baseunit=True).Quantity
    src = str(amount) + src
    return Q_(src).to(dst).magnitude

def arrayToType(type):
   
    if type == None :
        raise Exception('type in arrayToType is None')
    if type == 'e' or type == "c":
        return ["USD", "PLN", "HUF", "CHF", "GBP", "RUB", "CZK", "EUR"]
    elif type == 'vol':
        return ["mm**3", "cm**3", "dm**3", "m**3", "km**3", "ml", "l", "dl", "hl"]
    elif type == 'surf' :
        return ["mm**2", "cm**2", "dm**2", "m**2", "km**2", "are", "acre"]
    elif type == 'len' :
        return ["mm", "cm", "dm", "m", "km", "mile", "inch", "ft"]
    elif type == 'temp' :
        return ["kelvin", "degF", "degC"] 
    else :
        raise Exception('type is unknow command %s' % (type))
       
def rand_type(name):
    if name == None:
        raise Expcetion('name is unknow %s' % (name))
    if name == 'phys':
        return random.choice(["vol", "surf", "len", "temp"])
    elif name == 'math':
        return random.choice(["sqrt", "equa"])
    elif name == 'curr':
        return random.choice(["e", "c"])
    else :
        raise Exception("name in rand_type is unknown: %s" % (name))
      

    
def decider(type, question, src, dst,f = 2):
    if type == 'equa' :
        return eval(src)
    elif type == 'sqrt' :
        return [round(sqrt(float(question)), f)]
    elif type == 'e' or type == 'c' :
        raw = urllib2.urlopen("https://query.yahooapis.com/v1/public/yql?q=select%20Rate%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22" + src + dst + "%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
        rate = json.loads(raw.read())['query']['results']['rate']['Rate']
        range = type_to_range(type)        
        return [round(float(rate) * float(question), f),(range[1]-range[0])*float(rate)]
    elif type == 'vol' or type == 'surf' or type == 'len' or type == 'temp':
        array = arrayToType(type)
        if src in array and dst in array:
            return [round(converter(question, src, dst), f)]
        else:
            raise Exception("error unknow value of %s or %s" % (src, dst))
    else :
        raise Exception('type is unknow command %s' % s(type))      
    
def get_hint(request):
    if request.method == "POST" and request.is_ajax():
        j = json.loads(request.POST.get('data'))
        res = decider(j['type'], 1, j['fr'], j['to'],5)[0]
        
        if abs(res) <= 0.001:
            print res
            return HttpResponse(decider(j['type'], 1, j['to'], j['fr']))
        return HttpResponse(res)
    
def type_to_range(type):
    if type == None :
        raise Exception('type in is None')
    if type == 'e' :
        return (10, 120)
        default = 'EUR'
    elif type == 'c':
        return (300, 3000)
        default = 'CZK'
    elif type == 'temp':
        return (-40, 40)
    return (1, 100)
    
class CreateQuestion(CreateView):
        
    model = FloatModel
    fields = ['answer']            
    def parseToModel(self):

        js = json.loads(self.post.get('data'))
        ########temporaly // ToDo: replace block
        typ=self.post.get('type')
        ########temporaly // ToDo: replace block
        print "type",typ;
        try: 
            p = Params.objects.get(param1=js['fr'], param2=str(js['to']))
        except Params.DoesNotExist:
            p = Params(param1=js['fr'], param2=str(js['to']))
            p.save()
            
#         ########temporaly // ToDo: delete line
#         try:
#             t = Type.objects.get(type=js['type'])
#         except Type.DoesNotExist:
#             t = Type(type=js['type'])
#             t.save()
#             
        ########temporaly // ToDo: replace block

        try:
            t = Type.objects.get(type=typ)
        except Type.DoesNotExist:
            t = Type(type=typ)
            t.save()
        ########temporaly // ToDo: replace block
        self.model.question = js['question']
        try:
            if js['used_hint'] == '0':
                self.model.usedHint = False
            else :
                self.model.usedHint = True
        except KeyError:
            self.model.usedHint = False
        self.model.type = t
        self.model.params = p
        if self.request.user.is_authenticated():
            self.model.user = get_user(self.request)
        else :
            self.model.user = None
        self.model.answer = self.post.get('answer')
        self.model.time = self.post.get('time')
        
    def randArray(self, range, array, fr=None):
        if fr == None :
            fr = random.choice(array)          
        array.remove(fr)
        to = random.choice(array)
        q = random.randrange(range[0], range[1])
        return (fr, to, q)
    
    def get_context_data(self, **kwargs):
        ctx = super(CreateQuestion, self).get_context_data(**kwargs)
        self.type = self.kwargs.get('type', None)
        if self.type == None:
            raise Exception("type in CreateQuestion is None")

        splitted = self.type.split('-')
        if len(splitted) == 2 and (splitted[1] == 'all' or splitted[1] == 'a'):
            if splitted[1] == 'a':
                ctx['action'] = '/learning/all-all'
            else :
                ctx['action'] = self.request.path
            self.type = rand_type(splitted[0])
        ctx['type'] = self.type
        return ctx
    
class AjaxableResponseMixin(CreateQuestion):
    def form_invalid(self, form):
        if self.request.is_ajax():
            return HttpResponseBadRequest(json.dumps(form.errors))

    def form_valid(self, form):
        if self.request.is_ajax():
            print "i am here twice?"
            self.model = FloatModel()
            self.post = self.request.POST
            self.parseToModel()
#             if self.model.type.type == 'e' or self.model.type.type == 'c'
#             self.model.result = decider(self.model.type.type, self.model.question, self.model.params.param1, self.model.params.param2)
            res = decider(self.model.type.type, self.model.question, self.model.params.param1, self.model.params.param2)
            self.model.result = res[0]
            self.model.save()
            diff = self.model.result - float(self.model.answer)
#             if len(res) != 1:
#             else:
#                 return HttpResponse(res[1]-self.model.answer + "//" + )
#                 print "res",res[1]
            print "abs(diff):",abs(diff)
            diff = abs(diff)/self.model.result
            print "diff to send",diff
                
            return HttpResponse(str(diff) + '//' + str(self.model.result))
        
class CreateFrTo(AjaxableResponseMixin):
    default = None
    array = None
    range = None
    template_name = 'learning/frTo.html'
     
    def randArray(self, range, array, fr=None):
        
#         print fr
        fr, to, q = super(CreateFrTo, self).randArray(range, array, fr)
        if self.type != 'e' and self.type != 'c':
            m = converter(q, fr, to)
            if round(m, 2) == 0.0:
                pre = str(m).split("e-")
                if len(pre) == 2:
                    h = pow(10, int(pre[1]) - 1)
                else:
                    h = pow(10, len(str(m)) - 2)
                q = random.randrange(range[0] * h, range[1] * h)
        return fr, to, q                      
                
    def init(self) :
        range = type_to_range(self.type)
#         print range
        if self.type == 'e' :
            self.default = 'EUR'
        elif self.type == 'c':
            self.default = 'CZK'
        self.fr, self.to, self.question = self.randArray(range, arrayToType(self.type), self.default)
             
      
    def get_context_data(self, **kwargs):
        ctx = super(CreateFrTo, self).get_context_data(**kwargs)
        self.init()
        ctx['fr'] = self.fr
        ctx['to'] = self.to
        ctx['question'] = self.question
        return ctx
    

        
class CreateMath(AjaxableResponseMixin):
    template_name = 'learning/math/sqrt.html'
    def createEquation(self, oper, numEle, rangeEle):
        j = random.randint(numEle[0], numEle[1])
        oper = [random.choice(oper) for _ in range(j - 1)]
        numbers = [random.randrange(rangeEle[0], rangeEle[1]) for _ in range(j)]
        equation = str(numbers[0])
        counter = 1
        for char in oper:
            equation += ' ' + char + ' '
            if (char == '*'):
                numbers[counter] %= 15
            equation += str(numbers[counter])
            counter += 1
        return equation
            
    def init(self):
        if self.type == 'equa':
            self.question = self.createEquation("+-*", (2, 4), (100, 300))
            self.template_name = 'learning/math/equa.html'
        elif self.type == 'sqrt':
            self.question = random.randrange(1, 256)
        else:
            raise Exception("unknow type in CreateMath: %s" % (self.type))
            
        
    def get_context_data(self, **kwargs):
        ctx = super(CreateMath, self).get_context_data(**kwargs)
        
        self.init()
        ctx['question'] = self.question
        return ctx

def random_redirect(request):
    cat = {'phys':'conv', 'math':'math', 'curr':'conv'}
    name = random.choice(cat.keys())
    url = '/learning/%s/%s-a' % (cat.get(name), name)
    return redirect(url)
    ############################################################################

    
 
