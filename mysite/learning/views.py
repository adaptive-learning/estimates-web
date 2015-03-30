
from lazysignup.decorators import allow_lazy_user
from django.utils.decorators import method_decorator
from datetime import datetime
import json
from math import sqrt
import math
import random
from learning.forms import *
from static.python import variables
# import actualDB
from django.core import serializers
# from forms import *
from django.contrib.auth import get_user
from django.core.urlresolvers import reverse
from django.http import HttpResponse, HttpResponseBadRequest
from django.shortcuts import redirect, render, render_to_response, get_object_or_404
from django.template import RequestContext
from django.template.response import TemplateResponse
from django.utils import timezone
from django.views.decorators.csrf import ensure_csrf_cookie, csrf_protect
from django.views.generic import TemplateView
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView, FormView
from learning.models import *
from model import model
from pint import UnitRegistry
import urllib2
from datetime import tzinfo, timedelta, datetime

ZERO = timedelta(0)

class UTC(tzinfo):
  def utcoffset(self, dt):
    return ZERO
  def tzname(self, dt):
    return "UTC"
  def dst(self, dt):
    return ZERO

utc = UTC()

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
            
    elif type == 'curr':
        params = Params.objects.get(p1 = src, p2= dst,type = Type.objects.get(type = type))
        rate = CurrTable.objects.get(params = params).rate
        return round(rate * question)
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

def median(lst):
    lst = sorted(lst)
    if len(lst) < 1:
            return None
    if len(lst) %2 == 1:
            return lst[((len(lst)+1)/2)-1]
    if len(lst) %2 == 0:
            return float(sum(lst[(len(lst)/2)-1:(len(lst)/2)+1]))/2.0

class QuestionFunctions():
    def get_question(self,types,preffered=None):
        score = []
        t = Type.objects.filter(type__in = types)
        if preffered != None:
            query = preffered
        else:
            query = Params.objects.filter(type__in = t)
#         now = timezone.localtime(timezone.now())
        now = datetime.now(utc)
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
                except userSkill.DoesNotExist:
                    Stime = 0
                score.append((i.id,10*Sprob+10*Scount+120*Stime))
        maximum = max(score,key=lambda item:item[1])
        maximum = random.choice([i for i in score if i[1] == maximum[1]])
        print maximum
        toReturn = Concept.objects.get(id = maximum[0])
        if toReturn.question == None:
            q = None
        else: q = toReturn.question.question
        return (q,toReturn.params.p1,toReturn.params.p2)
        
    def check_type(self,*args,**kwargs):
        type = kwargs.get("type",None)
        if type not in [x.type for x in Type.objects.all()]:
            raise Exception("wrong params for type") 
        self.type = type
        
    def check_main(self,*args,**kwargs):
        main = kwargs.get("main",None)
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
            concept.label, userSkill.skill = model.myModel(self.model.label,userSkill.skill,concept.updatedTimes,1-concept.label,5,0.03,self.model.time)
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
            print "diff to send",self.model.label
            if "frTimeId" not in self.request.session and self.request.session["test"] == "time":
                self.request.session["frTimeId"] = self.model.id
            clear_session_params(self.request,["p1","question","p2"]);


            return HttpResponse("%s//%s"%(str(self.model.label),str(self.model.result)))
        

class CreateQuestion(AjaxableResponseMixin, CreateView,QuestionFunctions):
    model = FloatModel
    template_name = "learning/question.html"
    fields = ['answer']            
    def parseToModel(self):
        js = json.loads(self.post.get('data'))
        if self.request.session['test'] == "time":
            self.request.session['testParam'] = js['testP']
        elif self.request.session['test'] == "set":
            self.request.session['testParam'] += 1
        try: 
            p1 = js['p1'] if js['p1'] is not None else "-1"
            p2 = js['p2'] if js['p2'] is not None else "-1"
            par = Params.objects.get(p1 = p1,p2=p2)
        except Params.DoesNotExist:
            raise Exception("wrong params %s %s" % (js['p1'],js['p2']))
        type = self.post.get('type')
        if type == "":
            type = par.type.type
        try:
            t = Type.objects.get(type=type)
        except Type.DoesNotExist:
            raise Exception("wrong params %s"%(type)) 
        try:
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
        except Concept.DoesNotExist:
            raise Exception("wrong params for Concept when parsing to model")
        self.model.answer = self.post.get('answer')
        self.model.time = self.post.get('time')
        self.model.date = datetime.now(utc)
        
    def get_context_data(self, **kwargs):
        ctx = super(CreateQuestion, self).get_context_data(**kwargs)
        ctx['action'] = self.request.path
        isSettingsOn = False
        if "pref" in self.request.session and self.type == "settings":
                types = [x.type for x in self.request.session["pref"]]
                preffered = self.request.session["pref"]
                print "here"
                isSettingsOn = True
        else:
            clear_session_params(self.request,["pref"]);
            types = [self.kwargs.get("type",None)]
            if types == None:
                raise Exception("type is None in CreateQuestion")
            preffered = None
        q, pa1, pa2 = self.get_question(types,preffered)
        try:
            par = Params.objects.get(p1 = pa1,
                                           p2= pa2)
        except Params.DoesNotExist:
            raise Exception("wrong params for Params in get_context_data");
        self.type = par.type.type
        test = self.kwargs.get("test",None)
        if test is None : raise Exception("no test param in url")
        else: self.request.session['test'] = test

        self.request.session["type"] = self.type
        if isSettingsOn == False and self.is_new_test({"types":types,
                               "test":test,
                               "type":self.type,
                               }) :
            self.set_new_session({"types":types,
                               "test":test,
                               "type":self.type,
                               "p1":pa1,
                              "p2":pa2,
                              "question":q,
                              "pref":preffered})
        elif self.is_new_question({"p1":pa1,
                              "p2":pa2,
                              "question":q,}):
            self.set_new_session({"p1":pa1,
                              "p2":pa2,
                              "question":q,})
            
            

        if 'medTime' not in self.request.session:
            if q:
                quest = get_object_or_404(Questions, question = q)
            else:
                quest = None
            par = Params.objects.get(p1 = pa1, p2 = pa2)
            c = get_object_or_404(Concept, params = par,question = quest) 
            list = [x.time for x in FloatModel.objects.filter(concept = c)]
            if len(list) == 0:
                self.request.session['medTime']=15
            else:
                self.request.session['medTime']=median(list) 
        
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
            if p not in self.request.session:
                clear_session_params(self.request,dict.keys())
                clear_session_params(self.request,["pieTimer"])
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
            
    @method_decorator(allow_lazy_user)
    def get(self,*args, **kwargs):
        self.type = kwargs.get("type")
        pref = kwargs.get("pref",None)
        if pref: 
            type = kwargs.get("type",None)
            t = Type.objects.get(type = type)
            self.request.session["pref"] = Params.objects.filter(type = t, p1 = pref)
        super(CreateQuestion,self).get(*args,**kwargs)

        return render_to_response(self.template_name,self.ctx,RequestContext(self.request))
            
def date_handler(obj):
    return obj.isoformat() if hasattr(obj, 'isoformat') else obj

        
class CreateCurr(CreateQuestion):
    @method_decorator(allow_lazy_user)
    def get(self,*args, **kwargs):
        preffered = kwargs.get("pref",None)
        if preffered == "c":
            self.preffered = "CZK"
        elif preffered == "e":
            self.preffered = "EUR"
        super(CreateCurr,self).get(*args,**kwargs)
        return render_to_response(self.template_name,self.ctx,RequestContext(self.request))
 
def finish(request):
    if request.is_ajax() and request.method == "POST":
        if "pref" in request.session:
            types = [x.type for x in request.session["pref"]]
        else:
            types = request.session["types"]
        types = Type.objects.filter(type__in = types)
        if request.user.is_authenticated():
            loggUser = get_user(request).id
        else: 
            raise Exception("please log in")
        concepts = Params.objects.filter(type__in = types)
        s=0;
        if request.session["test"] == "time":
            if 'frTimeId' in request.session:
                date = FloatModel.objects.get(id = request.session["frTimeId"]).date
#                 now = timezone.localtime(timezone.now())
                now = datetime.now(utc)
                if date is None: date = now;
                f = FloatModel.objects.filter(user = loggUser, type__in = types, date__range=(date,now))
            else : s = 1
        elif request.session["test"] == "set":
            try:
                f = FloatModel.objects.filter(user = loggUser,type__in = types).order_by('-date')[:10]
            except FloatModel.DoesNotExist:
                raise Exception("f in finish is empty")
        if s != 1:    
            if len(f) != 0:
                s = sum([x.label for x in f])/len(f);
            else:
                raise Exception("p is 0")
        clear_session_params(request)
        try: uS = UserSkill.objects.filter(user = loggUser, concept__in = concepts)
        except UserSkill.DoesNotExist: return HttpResponse(s) 
        uS = (sum([x.skill for x in uS]))/float(len(uS))

        scores = [(model.score(1,x.label, x.time),x.id) for x in f]
        res = max(scores,key=lambda item:item[0])
        res = [x[1] for x in scores if x[0]==res[0]]
        ids = [x.id for x in f]
        res = [ids.index(x) for x in res]

        
        results = [ob.as_json() for ob in f]

        out = json.dumps(results)
        return HttpResponse("%s//%s//%s//%s"%(s,uS,out,res))
    
def clearSession(request):
    if request.method == "POST" and request.is_ajax():
        clear_session_params(request)
        return HttpResponse("ok")

def clear_session_params(request,params = ["pieTimer","p1","question","p2","testParam","test","type","frTimeId","types","pref"]):
    for param in params:
        if param in request.session:
            del request.session[param]
        else :
            print "no %s param in session" % param
    if "medTime" in request.session:
        print "clearing"
        del request.session["medTime"]

        
def random_redirect(request):
    cat = {'phys':'conv', 'math':'math', 'curr':'conv'}
    name = random.choice(cat.keys())
    url = '/learning/%s/%s-a' % (cat.get(name), name)
    return redirect(url)

class OwnChoice(ListView):
    model = Params
    template_name = "learning/selectOwn.html"
    def get_queryset(self,*args,**kwargs):

        q = super(OwnChoice,self).get_queryset(*args,**kwargs)
        if self.t == "all":
                return q
        typesString = variables.mainDict["nameTypes"][self.t]
        types = Type.objects.filter(type__in = typesString)
        q = q.filter(type__in = types)

        return q
    
    def get(self,*args,**kwargs):
        clear_session_params(self.request)
        self.t =  kwargs.get("type",None)
        if self.t == None: raise Exception
        return super(OwnChoice,self).get(*args,**kwargs)

    @method_decorator(allow_lazy_user)
    def post(self,*args,**kwargs):
        self.request.session["pref"] = []
        type = kwargs.get("type",None)
        if type == "all":
            params = Params.objects.all()
            types = Type.objects.all()
        else: 
            typesString = variables.mainDict["nameTypes"][kwargs.get("type",None)]
            types = Type.objects.filter(type__in = typesString)
            params = Params.objects.filter(type__in = types)
        for x in types:
            val = self.request.POST.get(x.type,None)
            if val == "all":
                self.request.session["pref"] += params.filter(type = x)
        for x in list(set([k.p1 for k in params])):
            l = self.request.POST.getlist(x,None)
            if l:
                try:
                    p = Params.objects.filter(p1=x, p2__in = l)
                    self.request.session["pref"] += p
                except Params.DoesNotExist:
                    continue
        return redirect("/learning/own/settings/set")           
                         
def getFromDict(request):
    if request.method == "POST" and not request.is_ajax():
        
        t = request.POST.get("type",None)
        if t == None: raise Exception 
        q = request.POST.get("question",None)
        if q == None: return HttpResponse(variables.mainDict[t])
        else: return HttpResponse( variables.mainDict[t][q])
        

class ShowTable(ListView):
    model = CurrTable  
    template_name = "learning/table.html"
#     def get_queryset(self,*args,**kwargs):
#         clear_session_params(self.request)
#         query = [TableView(rate = x.rate,type = Params.objects.get(id = x.params.id).type, p1 = x.params.p1,p2=x.params.p2) for x in CurrTable.objects.all()]
#         print query
#         return query

def save_time(request):
    if request.method == "POST" and request.is_ajax():
        time = request.POST.get("data")
#         if "pieTimer" in request.session:
#             request.session["pieTimer"] = time -request.session["pieTimer"]
#             ok = "false"
#         else:
#             request.session["pieTimer"] = time
#             ok = "true"
        return HttpResponse(time)
    
    ############################################################################