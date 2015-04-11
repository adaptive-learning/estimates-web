from django.utils import translation
from django.utils.translation import ugettext as _
import os
from django.core.mail import send_mail
from lazysignup.decorators import allow_lazy_user
from django.utils.decorators import method_decorator
from datetime import datetime
import time
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
from django.http import HttpResponseRedirect, HttpResponse, HttpResponseBadRequest
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

TIME_MOD = 120
COUNT_MOD = 10
PROB_MOD = 10


TIME_TEST = 150
SET_TEST = 10 

def index(request):
    clear_session_params(request)
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

    
def decider(type, question, src, dst, reverse, f = 2):
    if reverse:
        src , dst = dst, src
    if type == 'equa' :
        if dst != None:
            return eval(src+dst)
        else: return eval(src)
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
        concept = get_object_or_404(Concept, p1 = src, p2 = dst,type = get_object_or_404(Type,type = type))
        params = get_object_or_404(Params, concept = concept, reverse = reverse)
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
        res = decider(j['type'], 1, j['p1'], j['p2'], j['rev'],5)
        if abs(res) <= 0.001:
            return HttpResponse(decider(j['type'], 1, j['p1'], j['p2']),j['rev'])
        return HttpResponse(res)

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
            query = Concept.objects.filter(type__in = t)
        now = datetime.now(utc)
        for q in query:
            if self.request.user.is_authenticated():
                user = get_user(self.request)
                try:
                    userSkill = UserSkill.objects.get(user = user,concept = q)
                except UserSkill.DoesNotExist:
                    userSkill = UserSkill(user = user, concept = q, skill = 0, number = 0)
                    userSkill.save()
            else :
                raise Exception("please log in")
            params = Params.objects.filter(concept = q)
            questions = ConceptQuestion.objects.filter(params__in = params)
            for i in questions:
                floatmodels = FloatModel.objects.filter(conceptQuestion = i,user = user.id)
                if i.label == None:
                    i.label = 0.5;
                    i.save()
                Panswer = model.score(userSkill.skill,i.label)
                if Ptarget >= Panswer:
                    Sprob = Panswer/Ptarget
                else:
                    Sprob = (1-Panswer)/(1-Ptarget)
                Scount = 1/sqrt(1+len(floatmodels))
                try:
                    lastModel = floatmodels.latest('date')
                    Stime = -1/( now - lastModel.date).total_seconds()
                except FloatModel.DoesNotExist:
                    Stime = 0
                score.append((i.id,PROB_MOD*Sprob+COUNT_MOD*Scount+TIME_MOD*Stime))
        maximum = max(score,key=lambda item:item[1])
        maximum = random.choice([i for i in score if i[1] == maximum[1]])
        print maximum
        return get_object_or_404(ConceptQuestion,id = maximum[0])
        
    def check_type(self,*args,**kwargs):
        type = kwargs.get("type",None)
        if type not in [x.type for x in Type.objects.all()]:
            raise Exception("wrong params for type") 
        self.type = type
        
class AjaxableResponseMixin():
    def form_invalid(self, form):
        if self.request.is_ajax():
            return HttpResponseBadRequest(json.dumps(form.errors))
    def update_skill(self):
        if self.request.user.is_authenticated():
            user = get_user(self.request)
            question = get_object_or_404(ConceptQuestion, id = self.model.conceptQuestion.id)
            userSkill = get_object_or_404(UserSkill,user = user, concept = question.params.concept)
            question.label, userSkill.skill = model.myModel(self.model.label,userSkill.skill,
                                                            question.updatedTimes,1-question.label,
                                                            5,0.03,self.model.time)
            if question.label < 0: question.label = 0
            question.updatedTimes += 1;  
            question.save()
            userSkill.save()
        else:
            raise Exception("please log in")

    def get_proximation_error(self, model):
        question = model.conceptQuestion;
        src = question.params.concept.p1
        dst = question.params.concept.p2
        if question.params.reverse:
            src, dst = dst, src

        if model.type.type == "temp" and dst != "degC" and src == "degC":
            model.result = converter(model.result, src,"degC")
            model.answer = converter(model.answer, dst,"degC")
        if model.type.type == "equa": model.conceptQuestion.number.number = None
        if abs(float(model.result)) < 0.000001 : model.result = 0.000001
        diff = float(model.result) - float(model.answer)
        diff = abs(diff)/abs(float(model.result))
        if diff > 1: diff = 1.0
        return diff

    def form_valid(self, form):
        if self.request.is_ajax():
            self.model = FloatModel()
            self.post = self.request.POST
            self.parse_to_model()
            self.model.result = decider(self.model.type.type,
                                         self.model.conceptQuestion.number.number, 
                                         self.model.conceptQuestion.params.concept.p1, 
                                         self.model.conceptQuestion.params.concept.p2,
                                         self.model.conceptQuestion.params.reverse)
            self.model.label = self.get_proximation_error(self.model)
            self.model.save()
            self.update_skill()
            print "diff to send",self.model.label
            clear_session_params(self.request,["p1","question","p2"]);

            return HttpResponse("%s//%s"%(str(self.model.label),str(self.model.result)))

class CreateQuestion(AjaxableResponseMixin, CreateView,QuestionFunctions):
    model = FloatModel
    template_name = "learning/question.html"
    fields = ['answer']            
    def parse_to_model(self):
        js = json.loads(self.post.get('data'))
        self.request.session['setParam'] += 1

        p1 = js['p1'] if js['p1'] is not None else "-1"
        p2 = js['p2'] if js['p2'] != 'None' else None
        try:
            c = Concept.objects.get(p1 = p1, p2 = p2)
        except Concept.DoesNotExist:
            c = Concept.objects.get(p1 = p2, p2 = p1)
        
        par = get_object_or_404(Params, concept = c, reverse = self.request.session["rev"])
        type = self.post.get('type')

        if type == "":
            type = par.concept.type.type
        t = get_object_or_404(Type, type=type)
        n = get_object_or_404(Number, number=float(js['question'].replace(',','.')))

        self.model.type = t
        if self.request.user.is_authenticated():
            self.model.user = get_user(self.request)
        else :
            self.model.user = None

        print "here "
        print "type id",t.id
        print "par id",par.id
        print "number id",n.id
        self.model.conceptQuestion = get_object_or_404(ConceptQuestion, type=t, params = par,number=n)
        print "is the probblem"
        self.model.answer = self.post.get('answer')
        self.model.time = self.post.get('time')
        if int(self.model.time) > 60: self.model.time = 60
        self.model.date = datetime.now(utc)
        
    def get_context_data(self,*args, **kwargs):
        ctx = super(CreateQuestion, self).get_context_data(**kwargs)
        ctx['action'] = self.request.path
        if "pref" in self.request.session and (self.type == "settings" or self.kwargs.get("pref",None)):
                types = [x.type for x in self.request.session["pref"]]
                preffered = self.request.session["pref"]
                isSettingsOn = True
        else:
            clear_session_params(self.request,["pref"]);
            types = [self.kwargs.get("type",None)]
            if types == None:
                raise Exception("type is None in CreateQuestion")
            preffered = None
            isSettingsOn = False
        question = self.get_question(types,preffered)

        par = get_object_or_404(Params, id = question.params.id)

        self.type = question.type.type
        test = self.kwargs.get("test",None)
        if test is None : raise Exception("no test param in url")
#        TODO: not p1 and p2 but whole params
        pa1 = par.concept.p1
        pa2 = par.concept.p2
        q = question.number.number
        rev = par.reverse
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
                              "rev":rev,
                              "question":q,
                              "pref":preffered})
        elif self.is_new_question({"p1":pa1,
                              "p2":pa2,
                              "rev":rev,
                              "question":q,}):
            self.set_new_session({"p1":pa1,
                              "p2":pa2,
                              "rev":rev,
                              "question":q,
                              "test":test,})
        ctx["param"] = {
                        "p1":self.request.session["p1"],
                        "p2":self.request.session["p2"],
                        "reverse":self.request.session["rev"],
                        } 
        print "reverse in context data",self.request.session["rev"], rev
        if 'medTime' not in self.request.session:
            if q:
                quest = get_object_or_404(Number, number = q)
            else:
                quest = None
            l = [x.time for x in FloatModel.objects.filter(conceptQuestion = question)]
            
            if len(l) == 0:
                self.request.session['medTime']=15
            else:
                self.request.session['medTime']=median(l) 
        if self.request.session["test"] == "time":
            ctx["fullTime"] = TIME_TEST;
        num = Number.objects.get(number = self.request.session["question"])
        param = Params.objects.get(concept = Concept.objects.get(p1 = self.request.session["p1"],
                                                                 p2 = self.request.session["p2"],
                                                                 ),
                                   reverse = self.request.session["rev"])
        if len(Hint.objects.filter(conceptQuestion = ConceptQuestion.objects.get(params = param,
                                                                          number = num))) != 0:
            ctx["hint"] = True
        else: 
            ctx["hint"]= False
        self.ctx = ctx   
        return ctx

    def is_new_test(self,dict):
        for p in dict:
            if p not in self.request.session or self.request.session[p] != dict[p]:
                print "new test passed"
                clear_session_params(self.request)
                return True;
        return False;
    
    def is_new_question(self,dict):
        for p in dict:
            if p not in self.request.session:
                print "new question passed"
                clear_session_params(self.request,dict.keys())
                clear_session_params(self.request,["pieTimer"])
                return True;
        return False;

    def set_new_session(self,dict):
        print"setting new session"
        for p in dict:
            self.request.session[p] = dict[p]
        if 'setParam' not in self.request.session:
            print "not exist"
            if self.request.session["test"] == "set":
                self.request.session['setParam'] = 1
            elif self.request.session["test"] == "time":
                self.request.session['setParam'] = 0 
            else: 
                return HttpResponse(status = 401)
        else:
            print "eh?"
            print self.request.session["setParam"]
            
    @method_decorator(allow_lazy_user)
    def get(self,*args, **kwargs):
        if "test" in self.request.session:
            if self.request.session["test"] == "set":
                if self.request.session["setParam"] == SET_TEST+1:
                    return redirect("%s/finish"%self.request.path)           
            elif self.request.session["test"] == "time" and "timeParam" in self.request.session:
                pass
        self.type = kwargs.get("type")
        super(CreateQuestion,self).get(*args,**kwargs)
        return render_to_response(self.template_name,self.ctx,RequestContext(self.request))

class PreffQuestion(CreateQuestion):
    def get(self,*args,**kwargs):
        self.pref = kwargs.get("pref",None)
        if self.pref: 
            if "prefp" in self.request.session and self.request.session["prefp"] != self.pref:
                print "not equal"
                clear_session_params(self.request)
                clear_session_params(self.request,["prefp"])
            elif "prefp" not in self.request.session:
                print "print equal"
                clear_session_params(self.request) 
            if self.is_new_test({
                               "test":kwargs.get("test",None),
                               "type":kwargs.get("type",None),
                               }) :
                clear_session_params(self.request,["rev","p1","p2","question","test","type","pref","prefp"])
            self.request.session["prefp"] = self.pref
            type = kwargs.get("type",None)
            t = Type.objects.get(type = type)
            concept1 = Concept.objects.filter(p1 = self.pref, type = t)
            concept2 = Concept.objects.filter(p2 = self.pref, type = t)
            concepts = concept1 | concept2
            if len(concepts) == 0:
                raise Exception("no Concept with p1 or p2 equals %s"%self.pref)
            self.request.session["pref"] = concepts
        return super(PreffQuestion,self).get(*args,**kwargs)
            
def date_handler(obj):
    return obj.isoformat() if hasattr(obj, 'isoformat') else obj

class Finish(TemplateView):
    template_name = "learning/finish.html"
    def get_context_data(self,*args,**kwargs):
        ctx = super(Finish,self).get_context_data(*args,**kwargs)
        url = kwargs.get("url",None)
        ctx["url"] = self.url
        ctx["score"] = self.s
        ctx["userScore"] = self.uS
        ctx["answers"] = json.dumps(self.out)
        ctx["best"] = self.res
        return ctx

    def get(self,*args,**kwargs):
        self.url = kwargs.get("url",None)
        if "test" not in self.request.session:
            print self.url
            return redirect("/learning/%s"%self.url)
        self.get_finish_result(self.request)
        return super(Finish,self).get(*args,**kwargs)
    
    def post(self,*args,**kwargs):
        if self.request.session["test"] == "time" and self.request.is_ajax():
            print self.request.path
            return redirect("/%sfinish"%self.request.path)
    
    def get_finish_result(self,request):

        if "pref" in request.session and request.session["pref"] != None:
            types = [x.type for x in request.session["pref"]]
            toDelete = False
        else:
            toDelete = True
            types = request.session["types"]
            types = Type.objects.filter(type__in = types)
        if request.user.is_authenticated():
            loggUser = get_user(request).id
        else: 
            raise Exception("please log in")
        concepts = Concept.objects.filter(type__in = types)
        params = Params.objects.filter(concept__in = concepts)
        s=0;
        f = []
        if request.session["test"] == "time":
            count = int(request.session["setParam"])
            if count == 0:
                s = 1
            else:
                f = FloatModel.objects.filter(user_id = loggUser,type__in = types).order_by('-date')[:count]
        elif request.session["test"] == "set":
            f = FloatModel.objects.filter(user_id = loggUser,type__in = types).order_by('-date')[:SET_TEST]
        if s != 1:    
            if len(f) != 0:
                s = sum([x.label for x in f])/len(f);
            else:
                raise Exception("f is 0")
        if toDelete:
            clear_session_params(request)
        else:
            clear_session_params(request,["rev","pieTimer","p1","question",
                                           "p2","setParam","test","type","timeParam",
                                           "types"])
        uS = UserSkill.objects.filter(user = loggUser, concept__in = concepts)
        uS = (sum([x.skill for x in uS]))/float(len(uS))
        
        if len(f) != 0:
            scores = [(math.log1p(model.score(1,x.label, x.time)+(1/x.time)),x.id) for x in f]
            print scores
            res = max(scores,key=lambda item:item[0])
            res = [x[1] for x in scores if x[0]==res[0]]
            ids = [x.id for x in f]
            res = [ids.index(x) for x in res]
            results = [ob.as_json() for ob in f]

            self.out = results
            self.res = res
        else:
            self.out = []
            self.res = []
        self.s = s
        self.uS = uS
        
class CreateCurr(CreateQuestion):
    def get(self):
        clear_session_params(self.request)



def clearSession(request):
    if request.method == "POST" and request.is_ajax():
        clear_session_params(request)
        return HttpResponse("ok")

def clear_session_params(request,params = ["rev","pieTimer","p1","question",
                                           "p2","timeParam","test","type","setParam",
                                           "types","pref"]):
    if params[0] == "timeParam":
        print "CLEARING timeParam"
    for param in params:
        if param in request.session:
            del request.session[param]
        else :
            print "no %s param in session" % param
    if "medTime" in request.session:
        print "clearing"
        del request.session["medTime"]

        
class OwnChoice(ListView):
    model = Concept 
    template_name = "learning/selectOwn.html"
    def get_queryset(self,*args,**kwargs):
        q = super(OwnChoice,self).get_queryset(*args,**kwargs)
        if self.t == "all":
            print [x.type.type for x in q]
            return q
        typesString = variables.mainDict["nameTypesInDb"][self.t]
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
            concepts = Concept.objects.all()
            types = Type.objects.all()
        else: 
            typesString = variables.mainDict["nameTypesInDb"][kwargs.get("type",None)]
            types = Type.objects.filter(type__in = typesString)
            concepts = Concept.objects.filter(type__in = types)

        for x in types:
            val = self.request.POST.getlist(x.type,None)
            if len(val) != 0:
                if val[0] == "all":
                    concep = Concept.objects.filter(type = x)
                    self.request.session["pref"] += concepts.filter(type = x)
                elif val != None:
                    self.request.session["pref"] += concepts.filter(id__in = val)
        if self.request.session["pref"] == []:
            raise Exception("nothing was checked")

        return redirect("/learning/own/settings/set")           
                         
def getFromDict(request):
    if request.method == "POST" and request.is_ajax():
        t = request.POST.get("type",None)
        if t == None: raise Exception 
        q = request.POST.get("question",None)
        if q == "":
            out = json.dumps([x for x in variables.mainDict[t]])
            return HttpResponse(out)
        else:
            out = json.dumps([x for x in variables.mainDict[t][q]])
            return HttpResponse(out) 

class ShowTable(ListView):
    model = CurrTable  
    template_name = "learning/table.html"
    def get(self,*args,**kwargs):
        clear_session_params(self.request)
        return super(ShowTable,self).get(*args,**kwargs)

def save_time(request):
    if request.method == "POST" and request.is_ajax():
        time = request.POST.get("data")
        if "pieTimer" in request.session:
            toSend = float(time) - float(request.session["pieTimer"])
            ok = "true"
        else:
            ok = "false"
            toSend=0
            request.session["pieTimer"] = time
        Ttime = 0;
        if request.session["test"] == "time":
            if "timeParam" in request.session:
                Ttime = float(time) - float(request.session["timeParam"])
                if Ttime > TIME_TEST:
                    #TODO: test this
                    raise Exception("user opened closed time_test after %s sec"%TIME_SET)
                    redirect("%s/finish"%request.path)
            else:
                request.session["timeParam"] = float(time)
            
        return HttpResponse("%s//%s//%s"%(ok,toSend,Ttime))

    
def send_email(request):
    if request.method == 'POST' and request.is_ajax():
        send_mail('Feedback: priblizne.cz', request.POST.get("data"), request.POST.get("email"),
                  ["priblizne@googlegroups.com"], fail_silently=False)
        return HttpResponse("1");

def change_lang(request):
   
    translation.activate("en_US")
    print translation.get_language()
    return redirect("/learning")
    ############################################################################
