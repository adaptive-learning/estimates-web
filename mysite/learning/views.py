from learning.models import *
from django.http import HttpResponse, HttpResponseBadRequest
from django.core.urlresolvers import reverse
from django.views.decorators.csrf import ensure_csrf_cookie, csrf_protect
from math import sqrt
import random, json, urllib2
from django.contrib.auth import get_user
from pint import UnitRegistry
from django.template.response import TemplateResponse
from django.shortcuts import redirect
from model import model

from django.utils import timezone
from datetime import datetime
from django.views.generic.edit import CreateView 

TypeParams = {'e': ["USD", "PLN", "HUF", "CHF", "GBP", "RUB", "CZK"],
              'c': ["USD", "PLN", "HUF", "CHF", "GBP", "RUB", "EUR"],
              'vol': ["mm**3", "cm**3", "dm**3", "m**3", "km**3", "ml", "l", "dl", "hl"],
              'surf': ["mm**2", "cm**2", "dm**2", "m**2", "km**2", "are", "acre"],
              'len': ["mm", "cm", "dm", "m", "km", "mile", "inch", "ft"],
              'temp':["kelvin", "degF", "degC"],
             }
NameTypes = {'math': ["sqrt", "equa","angle"],
             'curr': ["e", "c"],
             'phys': ["vol", "surf", "len", "temp"],
            }

Ptarget = 0.75
Wcount = 10
Wtarget = 10


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
       
def get_types(name):
    if name == None:
        raise Expcetion('name is unknow %s' % (name))
    return NameTypes.get(name)

    
def decider(type, question, src, dst,f = 2):
    if type == 'equa' :
        return eval(question)
    elif type == 'sqrt' :
        return round(sqrt(float(question)), f)
    elif type == "angle":
        if src == "inn":
            return question
        elif dst == "out":
            return 360-question
        else: raise Exception("wrong params") 
            
    elif type == 'e' or type == 'c' :
        raw = urllib2.urlopen("https://query.yahooapis.com/v1/public/yql?q=select%20Rate%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22" + src + dst + "%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
        rate = json.loads(raw.read())['query']['results']['rate']['Rate']
        range = type_to_range(type)        
        return round(float(rate) * float(question), f)
    elif type == 'vol' or type == 'surf' or type == 'len' or type == 'temp':
        array = arrayToType(type)
        if src in array and dst in array:
            return (round(converter(question, src, dst),f))
        else:
            raise Exception("error unknow value of %s or %s" % (src, dst))
    else :
        raise Exception('type is unknow command %s' % s(type))      
    
def get_hint(request):
    if request.method == "POST" and request.is_ajax():
        j = json.loads(request.POST.get('data'))
        res = decider(j['type'], 1, j['fr'], j['to'],5)
        
        if abs(res) <= 0.001:
#             print res
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
        try: 
            p = Params.objects.get(param1=js['fr'], param2=str(js['to']))
        except Params.DoesNotExist:
            raise Exception("wrong params %s %s" % (js['fr'],js['to']))
        type = self.post.get('type')
        print p
        try:
            t = Type.objects.get(type=type)
        except Type.DoesNotExist:
            raise Exception("wrong params %s"%(type)) 
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

    def get_question(self,types):
        score = []
        for type in types:
            t = Type.objects.get(type = type)
            query = Params.objects.filter(type = t)

            if self.request.user.is_authenticated():
                user = get_user(self.request)
                try:
                    userSkill = UserSkill.objects.get(user = user,type = t)
                except UserSkill.DoesNotExist:
                    userSkill = UserSkill(user = user, type = t,skill = 0.5)
                    userSkill.save()
                userSkill = userSkill.skill
            else :
                p = FloatModel.objects.filter(type = t)
                userSKill = sum([x.label for x in p]) / float(len(p))

            for i in query:
                if self.request.user.is_authenticated():
                    floatmodels = FloatModel.objects.filter(params = i, user = get_user(self.request).id)
                else:
                    floatmodels = FloatModel.objects.filter(params = i)
                if len(floatmodels) != 0:
                    hard = sum([x.label for x in floatmodels]) / float(len(floatmodels))
                else:
                    hard = 0.5
                Panswer = model.Pcorrect(userSkill,hard)
                if Ptarget >= Panswer:
                    Sprob = Panswer/Ptarget
                else:
                    Sprob = (1-Panswer)/(1-Ptarget)
                Scount = 1/sqrt(1+len(floatmodels))
                try:
                    Stime = -1/(timezone.localtime(timezone.now()) - floatmodels.latest('date').date).total_seconds()
                except FloatModel.DoesNotExist:
                    Stime = 0
                score.append((i.id,10*Sprob+10*Scount+120*Stime))
        maximum = max(score,key=lambda item:item[1])
        print score
        print maximum
        toReturn = Params.objects.get(id = maximum[0])
        return (toReturn.param1,toReturn.param2)
        

    def randArray(self, range):
        q = random.randrange(range[0], range[1])
        return (q)
    
    def get_context_data(self, **kwargs):
        ctx = super(CreateQuestion, self).get_context_data(**kwargs)
        type = self.kwargs.get('type', None)
        if type == None:
            raise Exception("type in CreateQuestion is None")
        splitted = type.split('-')
        
        if len(splitted) == 2 and (splitted[1] == 'all' or splitted[1] == 'a'):
            if splitted[1] == 'a':
                ctx['action'] = '/learning/all-all'
            else:
                ctx['action'] = self.request.path
            types = get_types(splitted[0])
        if len(splitted) == 1:
            types = [type]
        param1, param2 = self.get_question(types)
        self.type = Params.objects.get(param1=param1, param2=param2).type.type
        ctx['type'] = self.type
        ctx['p1'] = param1
        ctx['p2'] = param2
        return (ctx, param1, param2)
    
class AjaxableResponseMixin(CreateQuestion):
    def form_invalid(self, form):
        if self.request.is_ajax():
            return HttpResponseBadRequest(json.dumps(form.errors))
    def update_skill(self):
        if self.request.user.is_authenticated():
            user = get_user(self.request)
            userSkill = UserSkill.objects.get(user = user, type = self.model.type)
            try:
                p = FloatModel.objects.filter(user = user.id, params = self.model.params)
            except FloatModel.DoesNotExist:
                print "something is wrong"
                p = FloatModel.objects.filter(params = self.model.params)
            aver = sum([i.label for i in p])/float(len(p))
            userSkill.skill = model.elo(self.model.label,userSkill.skill,aver)
            if userSkill.skill < 0: userSkill.skill = 0
            userSkill.save()

    def get_proximation_error(self, model):
        if model.type.type == "temp" and model.params.param2 != "degC":
            model.result = converter(model.result,model.params.param2,"degC")
            model.answer = converter(model.answer,model.params.param2,"degC")
        if model.type.type == "equa": model.question = None
        if abs(model.result) < 0.000001 : model.result = 0.000001
        diff = model.result - float(model.answer)
        diff = abs(diff)/abs(float(model.result))
        if diff > 1: diff = 1.0
        return diff

    def form_valid(self, form):
        if self.request.is_ajax():
            self.model = FloatModel()
            self.post = self.request.POST
            self.parseToModel()
            self.model.result = decider(self.model.type.type, self.model.question, self.model.params.param1, self.model.params.param2)
            self.model.label = self.get_proximation_error(self.model)
            self.model.save()
            self.update_skill()
            print "diff to send",self.model.label
                
            return HttpResponse(str(self.model.label))
        
class CreateFrTo(AjaxableResponseMixin):
    default = None
    array = None
    range = None
    template_name = 'learning/frTo.html'
     
    def randArray(self, range, fr, to):
        
        q = super(CreateFrTo, self).randArray(range)
        if self.type != 'e' and self.type != 'c':
            m = converter(q, fr, to)
            if round(m, 2) == 0.0:
                pre = str(m).split("e-")
                if len(pre) == 2:
                    h = pow(10, int(pre[1]) - 1)
                else:
                    h = pow(10, len(str(m)) - 2)
                q = random.randrange(range[0] * h, range[1] * h)
        return q                      
                
    def init(self) :
        range = type_to_range(self.type)
        self.question = self.randArray(range, self.fr, self.to)
             
      
    def get_context_data(self, **kwargs):
        ctx,self.fr, self.to = super(CreateFrTo, self).get_context_data(**kwargs)
        self.init()
        ctx['question'] = self.question
        return ctx
    

        
class CreateMath(AjaxableResponseMixin):
    template_name = 'learning/math/math.html'
    def create_equation(self,p1,p2):
        equation = []
        print p2 
        for i in p2:
            if i == "0":
                equation.append(str(random.randrange(1,51)))
            elif i == "1":
                equation.append(str(random.randrange(50,101)))
            elif i == "2":
                equation.append(str(random.randrange(100,151)))
            elif i == "3":
                equation.append(str(random.randrange(150,202)))
            elif i == "4":
                equation.append(str(random.randrange(200,257)))
        print equation
        counter = 1
        for oper in p1: 
            equation.insert(counter,oper)
            counter += 2
        return ' '.join(equation) 
    
    def create_rand_equation(self,ran):
        num = str(random.randrange(0,5))
        oper = ""
        for i in range(ran):
            oper += str(random.choice("+-*"))
            if oper[len(oper)-1] == '*':
                if random.choice("ba") == 'b':
                    num = num[:(len(num)-1)] + '0'
                    num += str(random.randrange(0,5))
                else:
                    num += '0'
            else:
                num += str(random.randrange(0,5))
        return (oper,num)
    def create_angle(self,size):
        if size == "0":
            return random.randrange(1,46)
        elif size == "1":
            return random.randrange(46,91)
        elif size == "2":
            return random.randrange(91,136)
        elif size == "3":
            return random.randrange(136,181)
        else:
            raise Exception("Wrong size")
            
    def init(self):
        if self.type == 'equa':
            oper, num = self.create_rand_equation(random.randrange(1,4))
            Params.objects.get_or_create(param1 = oper, param2 = num,type_id = 6)
            self.question = self.create_equation(oper,num)
            print self.question
        elif self.type == 'sqrt':
            self.question = random.randrange(1, 256)
        elif self.type == 'angle':
            self.question = self.create_angle(self.param2)
        else:
            raise Exception("unknow type in CreateMath: %s" % (self.type))
        
    def get_context_data(self, **kwargs):
        ctx,self.param1,self.param2 = super(CreateMath, self).get_context_data(**kwargs)
        self.init()
        print self.question

        ctx['question'] = self.question
        return ctx

def random_redirect(request):
    cat = {'phys':'conv', 'math':'math', 'curr':'conv'}
    name = random.choice(cat.keys())
    url = '/learning/%s/%s-a' % (cat.get(name), name)
    return redirect(url)
    ############################################################################

    
 
