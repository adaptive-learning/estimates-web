import math
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
from django.views.generic import TemplateView
from django.views.generic.edit import CreateView 

TypeParams = {'e': ["USD", "PLN", "HUF", "CHF", "GBP", "RUB", "CZK"],
              'c': ["USD", "PLN", "HUF", "CHF", "GBP", "RUB", "EUR"],
              'vol': ["mm**3", "cm**3", "dm**3", "m**3", "km**3", "ml", "l", "dl", "hl"],
              'surf': ["mm**2", "cm**2", "dm**2", "m**2", "km**2", "are", "acre"],
              'len': ["mm", "cm", "dm", "m", "km", "mile", "inch", "ft"],
              'temp':["kelvin", "degF", "degC"],
             }
NameTypes = {'math': ["sqrt", "equa"],
             'curr': ["e", "c"],
             'phys': ["vol", "surf", "len", "temp"],
             'grap': ["angle","water"],
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
        raise Exception('name is unknow %s' % (name))
    return NameTypes.get(name)

    
def decider(type, question, src, dst,f = 2):
    if type == 'equa' :
        return eval(question)
    elif type == 'sqrt' :
        return round(sqrt(float(question)), f)
    elif type == "water":
        print float(question)
        angle = math.tan(math.radians(float(dst)-90))
        print "angle",angle
        top = ((angle*100)*2)+float(src)
        print "top",top
        right = ((angle*float(question))*2)+float(src)
        print "right",right
        Vwhole = ((top + float(src))*100)/2
        print "whole",Vwhole
        Vright = ((right + float(src))*float(question))/2
        print "Vright",Vright
        return (Vright / Vwhole)*100
    elif type == "angle":
        if src == "inn":
            return question
        elif src == "out":
            return 360-float(question)
        else: raise Exception("wrong params") 
            
    elif type == 'e' or type == 'c' :
        raw = urllib2.urlopen("https://query.yahooapis.com/v1/public/yql?q=select%20Rate%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22" + src + dst + "%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
        rate = json.loads(raw.read())['query']['results']['rate']['Rate']
        range = type_to_range(type)        
        return round(float(rate) * float(question), f)
    elif type == 'vol' or type == 'surf' or type == 'len' or type == 'temp':
        array = arrayToType(type)
#         if src in array and dst in array:
        return (round(converter(question, src, dst),f))
#         else:
#             raise Exception("error unknow value of %s or %s" % (src, dst))
    else :
        raise Exception('type is unknow command %s' % (type))      
    
def get_hint(request):
    if request.method == "POST" and request.is_ajax():
        j = json.loads(request.POST.get('data'))
        res = decider(j['type'], 1, j['p1'], j['p2'],5)
        if abs(res) <= 0.001:
            return HttpResponse(decider(j['type'], 1, j['p1'], j['p2']))
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

class QuestionFunctions():
    def get_question(self,types):
        score = []
        for type in types:
            print type
            t = Type.objects.get(type = type)
            query = Concept.objects.filter(type = t)
    
            if self.request.user.is_authenticated():
                user = get_user(self.request)
                try:
                    userSkill = UserSkill.objects.get(user = user,type = t)
                except UserSkill.DoesNotExist:
                    userSkill = UserSkill(user = user, type = t,skill = 0.5)
                    userSkill.save()
                userSkill = userSkill.skill
            else :
                p = UserSkill.objects.filter(type = t)
                if len(p) == 0:
                    userSkill = 0.5
                else:
                    userSkill = sum(float(x.skill) for x in p) / float(len(p))
    
            for i in query:
                if self.request.user.is_authenticated():
                    floatmodels = FloatModel.objects.filter(concept = i, user = get_user(self.request).id)
                else:
                    floatmodels = FloatModel.objects.filter(concept = i)
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
        maximum = random.choice([i for i in score if i[1] == maximum[1]])
        print maximum
        toReturn = Concept.objects.get(id = maximum[0])
        return (toReturn.question,toReturn.param1,toReturn.param2)

class CreateQuestion(CreateView):
    model = FloatModel
    template_name = "learning/non-frTo.html"
    fields = ['answer']            
    def parseToModel(self):
        js = json.loads(self.post.get('data'))
        try: 
            p = js['p1'] if js['p1'] is not None else "-1"
            p1 = Params.objects.get(param=p)
            p = js['p2'] if js['p2'] is not None else "-1"
            p2 = Params.objects.get(param = p)
        except Params.DoesNotExist:
            raise Exception("wrong params %s %s" % (js['p1'],js['p2']))
        type = self.post.get('type')
        try:
            t = Type.objects.get(type=type)
        except Type.DoesNotExist:
            raise Exception("wrong params %s"%(type)) 
        try:
            print js['question'];
            q = Questions.objects.get(question=float(js['question'].replace(',','.')))
        except Questions.DoesNotExist:
            raise Exception("wrong params %s"%(js['question']));
        try:
            if js['used_hint'] == '0':
                self.model.usedHint = False
            else :
                self.model.usedHint = True
        except KeyError:
            self.model.usedHint = False
        self.model.type = t
        if self.request.user.is_authenticated():
            self.model.user = get_user(self.request)
        else :
            self.model.user = None
        try:
            print(t.type,p1.param,p2.param,q.question)
            self.model.concept = Concept.objects.get(type=t, param1 = p1,param2=p2,question=q)
        except Concept.DoesNotExit:
            raise Exception("wrong params for Concept when parsing to model")
        self.model.answer = self.post.get('answer')
        self.model.time = self.post.get('time')

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
        q, param1, param2 = self.get_question(types)
        try:
            print q.id,param1.id,param2.id
            
            self.type = Concept.objects.get(question = q,param1=param1, param2=param2).type.type
            
        except Concept.DoesNotExist:
            raise Exception("wrong params for concept in get_context_data");
        testType = self.kwargs.get("test",None)
        if testType == None:
            raise Exception("wrong testType")
        if testType == "time":
            ctx['test'] = timezone.localtime(timezone.now())
            print ctx['test']
        else:
            ctx['test'] = "test"    
        ctx['type'] = self.type
        ctx['p1'] = param1.param if param1 != None else None
        ctx['p2'] = param2.param if param2 != None else None
        ctx['question']=q.question
        return ctx
    
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
        if model.type.type == "temp" and model.concept.param2.param != "degC" and model.concept.param1.param == "degC":
            model.result = converter(model.result,model.concept.param2.param,"degC")
            model.answer = converter(model.answer,model.concept.param2.param,"degC")
        if model.type.type == "equa": model.concept.question.question = None
        if abs(float(model.result)) < 0.000001 : model.result = 0.000001
        diff = float(model.result) - float(model.answer)
        diff = abs(diff)/abs(float(model.result))
        if diff > 1: diff = 1.0
        return diff

    def form_valid(self, form):
        if self.request.is_ajax():
            self.model = FloatModel()
            self.post = self.request.POST
            self.parseToModel()
            self.model.result = decider(self.model.type.type,
                                         self.model.concept.question.question, 
                                         self.model.concept.param1.param, 
                                         self.model.concept.param2.param)
            self.model.label = self.get_proximation_error(self.model)
            self.model.save()
            self.update_skill()
            print "diff to send",self.model.label
                
            return HttpResponse("%s//%s"%(str(self.model.label),str(self.model.result)))
        
class CreateFrTo(AjaxableResponseMixin, QuestionFunctions):
    template_name = 'learning/frTo.html'
    def get_context_data(self, **kwargs):
        ctx = super(CreateFrTo, self).get_context_data(**kwargs)
#         self.init()
        return ctx
    

        
class CreateMath(AjaxableResponseMixin, QuestionFunctions):
    template_name = 'learning/non-frTo.html'
       
    def get_context_data(self, **kwargs):
        ctx = super(CreateMath, self).get_context_data(**kwargs)
#         self.init()
        return ctx

class CreateGraphical(AjaxableResponseMixin, QuestionFunctions):
    template_name = "learning/non-frTo.html"
    def get_context_data(self, **kwargs):
        ctx = super(CreateGraphical,self).get_context_data(**kwargs)
#         print self.question
        ctx['question']=int(ctx['question'])
        return ctx

class NextQuestion(TemplateView,QuestionFunctions):
    template_name = ""
    
    def get_context_data(self,**kwargs):
        return HttpResponse("success")

def finish(request):
    if request.is_ajax() and request.method == "POST":
        t = Type.objects.get(type = request.POST.get("type"))
        date = request.POST.get("data")
        print date
        if date != None:
            now = timezone.localtime(timezone.now())
            print (now)
            if request.user.is_authenticated():
                
                f = FloatModel.objects.filter(user = get_user(request).id, type = t, date__range=(date,now))
            else :
                f = FloatModel.objects.filter(user = None, type = t, date__range=(date,now))
        else:
            if request.user.is_authenticated():
                f = FloatModel.objects.filter(user = get_user(request).id,type = t).order_by('date')[:10]
            else:
                f = FloatModel.objects.filter(user = None, type = t).order_by('date')[:10]
        if len(f) != 0:
            s = sum([x.label for x in f])/len(f);
        else:
            raise Exception("p is 0")
        try: uS = UserSkill.objects.get(user = get_user(request).id)
        except UserSkill.DoesNotExist: return HttpResponse(s)
        return HttpResponse("%s//%s"%(s,uS))
    
        
def random_redirect(request):
    cat = {'phys':'conv', 'math':'math', 'curr':'conv'}
    name = random.choice(cat.keys())
    url = '/learning/%s/%s-a' % (cat.get(name), name)
    return redirect(url)
    ############################################################################

    
 
