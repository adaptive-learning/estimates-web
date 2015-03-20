from lazysignup.decorators import allow_lazy_user
from django.utils.decorators import method_decorator
from datetime import datetime
import json
from math import sqrt
import math
import random
# import actualDB

from django.contrib.auth import get_user
from django.core.urlresolvers import reverse
from django.http import HttpResponse, HttpResponseBadRequest
from django.shortcuts import redirect, render, render_to_response, get_object_or_404
from django.template import RequestContext
from django.template.response import TemplateResponse
from django.utils import timezone
from django.views.decorators.csrf import ensure_csrf_cookie, csrf_protect
from django.views.generic import TemplateView
from django.views.generic.edit import CreateView
from learning.models import *
from model import model
from pint import UnitRegistry
import urllib2


TypeParams = {
              'e': ["USD", "PLN", "HUF", "CHF", "GBP", "RUB", "CZK"],
              'c': ["USD", "PLN", "HUF", "CHF", "GBP", "RUB", "EUR"],
              'vol': ["mm**3", "cm**3", "dm**3", "m**3", "km**3", "ml", "l", "dl", "hl"],
              'surf': ["mm**2", "cm**2", "dm**2", "m**2", "km**2", "are", "acre"],
              'len': ["mm", "cm", "dm", "m", "km", "mile", "inch", "ft"],
              'temp':["kelvin", "degF", "degC"],
             }
NameTypes = {'math': ["sqrt", "equa"],
             'curr': ["e", "c"],
             'phys': ["vol", "surf", "len", "temp"],
             'grap': ["angle","water","line","obh"],
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
    elif type == "obj":
        return float(question)+float(src)+float(dst);
    elif type == "sqr":
        return math.pow(float(question),float(src))
    elif type == "water":
        q = float(question)*float(dst)
        full = float(src)*float(dst)
        right = float(q)*float(src)
        return (right/full)
    elif type == "line":
        return round(float(src)/float(question),f)
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
        return (round(converter(question, src, dst),f))
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
        t = Type.objects.filter(type__in = types)
        query = Params.objects.filter(type__in = t)
        now = timezone.localtime(timezone.now())
        for q in query:
            if self.request.user.is_authenticated():
                user = get_user(self.request)
                try:
                    userSkill = UserSkill.objects.get(user = user,concept = q)
                except UserSkill.DoesNotExist:
                    userSkill = UserSkill(user = user, concept = q,skill = 0,number = 0)
                    userSkill.save()
            else :
                raise Exception("please log in")
                p = UserSkill.objects.filter(concept = q)
                if len(p) == 0:
                    userSkill = 0
                else:
                    userSkill = sum(float(x.skill) for x in p) / float(len(p))
            concepts = Concept.objects.filter(params = q)
            for i in concepts:
                floatmodels = FloatModel.objects.filter(concept = i,user = user.id)
                if i.label == None:
                    i.label = 0.5;
                    i.save()
                Panswer = model.score(userSkill.skill,i.label)
                if Ptarget >= Panswer:
                    Sprob = Panswer/Ptarget
                else:
                    Sprob = (1-Panswer)/(1-Ptarget)
                Scount = 1/sqrt(1+userSkill.number)
                try:
                    Stime = -1/( now - userSkill.date).total_seconds()
                except FloatModel.DoesNotExist:
                    Stime = 0
                score.append((i.id,10*Sprob+10*Scount+120*Stime))
        maximum = max(score,key=lambda item:item[1])
        maximum = random.choice([i for i in score if i[1] == maximum[1]])
        print maximum
        toReturn = Concept.objects.get(id = maximum[0])
        return (toReturn.question.question,toReturn.params.p1,toReturn.params.p2)
        
    def check_main(self,*args,**kwargs):
        main = kwargs.get("main",None)
        print main
        if main not in ["grap","conv","math"]:
            raise Exception("wrong params for mainType")
        super(CreateQuestion,self).get(*args, ** kwargs)
        return render_to_response(self.template_name,self.ctx,RequestContext(self.request))
    
class AjaxableResponseMixin():
    def form_invalid(self, form):
        if self.request.is_ajax():
            return HttpResponseBadRequest(json.dumps(form.errors))
    def update_skill(self):
        if self.request.user.is_authenticated():
            user = get_user(self.request)
            userSkill = get_object_or_404(UserSkill,user = user, concept = self.model.concept.params)
            concept = get_object_or_404(Concept,id = self.model.concept.id)
            concept.label, userSkill.skill = model.myModel(self.model.label,userSkill.skill,concept.updatedTimes,1-concept.label,5,0.03)
            if concept.label < 0: concept.label = 0
            userSkill.date = self.model.date
            userSkill.number += 1
            concept.updatedTimes += 1;  
            concept.save()
            userSkill.save()
        else:
            raise Exception("please log in")

    def get_proximation_error(self, model):
        if model.type.type == "temp" and model.concept.params.p2 != "degC" and model.concept.params.p1 == "degC":
            model.result = converter(model.result,model.concept.params.p1,"degC")
            model.answer = converter(model.answer,model.concept.params.p2,"degC")
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
                                         self.model.concept.params.p1, 
                                         self.model.concept.params.p2)
            self.model.label = self.get_proximation_error(self.model)
            self.model.save()
            self.update_skill()
            print self.model.id
            print "diff to send",self.model.label
            if "frTimeId" not in self.request.session and self.request.session["test"] == "time":
                self.request.session["frTimeId"] = self.model.id
            clear_session_params(self.request,["p1","question","p2"]);


            return HttpResponse("%s//%s"%(str(self.model.label),str(self.model.result)))
        

class CreateQuestion(AjaxableResponseMixin, CreateView,QuestionFunctions):
    model = FloatModel
    template_name = "learning/non-frTo.html"
    fields = ['answer']            
    def parseToModel(self):
        js = json.loads(self.post.get('data'))
        if self.request.session['test'] == "time":
            self.request.session['testParam'] = js['testP']
        elif self.request.session['test'] == "set":
            print "counting + 1"
            self.request.session['testParam'] += 1
        try: 
            p1 = js['p1'] if js['p1'] is not None else "-1"
            p2 = js['p2'] if js['p2'] is not None else "-1"
            par = Params.objects.get(p1 = p1,p2=p2)
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
            self.model.concept = Concept.objects.get(type=t, params = par,question=q)
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
        elif len(splitted) == 1:
            types = [type]
        
        q, pa1, pa2 = self.get_question(types)
        try:
            self.type = Params.objects.get(p1 = pa1,
                                           p2= pa2).type.type
        except Concept.DoesNotExist:
            raise Exception("wrong params for Params in get_context_data");
        test = self.kwargs.get("test",None)
        if test is None : return HttpResponse(status=410)
        
        if self.is_new_test({"types":types,
                               "test":test,
                               "type":self.type,
                               }):
            self.set_new_session({"types":types,
                               "test":test,
                               "type":self.type,
                               "p1":pa1,
                              "p2":pa2,
                              "question":q,})
        elif self.is_new_question({"p1":pa1,
                              "p2":pa2,
                              "question":q,}):
            self.set_new_session({"p1":pa1,
                              "p2":pa2,
                              "question":q,})
        self.ctx = ctx       
        return ctx

    def is_new_test(self,dict):
        for p in dict:
            if p not in self.request.session or self.request.session[p] != dict[p]:
                clear_session_params(self.request)
                return True;
        return False;
    
    def is_new_question(self,dict):
        for p in dict:
            if p not in self.request.session: #or self.request.session[p] != dict[p]:
                clear_session_params(self.request,dict.keys())
                return True;
        return False;

    def set_new_session(self,dict):
        for p in dict:
            self.request.session[p] = dict[p]
        if 'testParam' not in self.request.session:
            if self.request.session["test"] == "set":
                self.request.session['testParam'] = 1;
            elif self.request.session["test"] == "time":
                self.request.session['testParam'] = -1 
            else: 
                return HttpResponse(status = 401)
            
def date_handler(obj):
    return obj.isoformat() if hasattr(obj, 'isoformat') else obj

        
class CreateFrTo(CreateQuestion):
    template_name = 'learning/frTo.html'
    @method_decorator(allow_lazy_user)
    def get(self,*args, **kwargs):
        super(CreateFrTo,self).get(*args,**kwargs)
        return render_to_response(self.template_name,self.ctx,RequestContext(self.request))

class CreateNonFrTo(CreateQuestion):
    @method_decorator(allow_lazy_user)
    def get(self,*args, **kwargs):
        super(CreateNonFrTo, self).get(*args, **kwargs)
        self.check_main(*args,**kwargs)
        return render_to_response(self.template_name,self.ctx,RequestContext(self.request))
        
class NextQuestion(TemplateView,QuestionFunctions):
    template_name = ""
    def get_context_data(self,**kwargs):
        return HttpResponse("success")

def finish(request):
    if request.is_ajax() and request.method == "POST":
        t = Type.objects.filter(type__in = request.session["types"])
        if request.user.is_authenticated():
            loggUser = get_user(request).id
        else: 
            raise Exception("please log in")
        concepts = Params.objects.filter(type__in = t)
        s=0;
        if request.session["test"] == "time":
            if 'frTimeId' in request.session:
                date = FloatModel.objects.get(id = request.session["frTimeId"]).date
                now = timezone.localtime(timezone.now())
                if date is None: date = now;
                f = FloatModel.objects.filter(user = loggUser, type__in = t, date__range=(date,now))
            else : s = 1
        elif request.session["test"] == "set":
            f = FloatModel.objects.filter(user = loggUser,type__in = t).order_by('date')[:10]
        if s != 1:    
            if len(f) != 0:
                s = sum([x.label for x in f])/len(f);
            else:
                raise Exception("p is 0")
        clear_session_params(request)
        
        try: uS = UserSkill.objects.filter(user = loggUser, concept__in = concepts)
        except UserSkill.DoesNotExist: return HttpResponse(s) 
        uS = (sum([x.skill for x in uS]))/float(len(uS))
        return HttpResponse("%s//%s"%(s,uS))
    
def clearSession(request):
    if request.method == "POST" and request.is_ajax():
        clear_session_params(request)
        return HttpResponse("ok")

def clear_session_params(request,params = ["p1","question","p2","testParam","test","type","frTimeId","types"]):
    for param in params:
        if param in request.session:
            del request.session[param]
        else :
            print "no %s param in session" % param

        
def random_redirect(request):
    cat = {'phys':'conv', 'math':'math', 'curr':'conv'}
    name = random.choice(cat.keys())
    url = '/learning/%s/%s-a' % (cat.get(name), name)
    return redirect(url)
    ############################################################################

    
 