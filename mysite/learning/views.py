# -*- coding: utf-8 -*-
from django.utils import translation
from django.utils.translation import ugettext as _
import os
from django.core.mail import send_mail
from lazysignup.decorators import allow_lazy_user
from django.core.mail import EmailMultiAlternatives
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

def get_volume(jsonObject): 
    if jsonObject["t"] == "c":
        return math.pi * pow(jsonObject["r"],2)


def converter(amount, src, dst):
    Q_ = UnitRegistry(autoconvert_offset_to_baseunit=True).Quantity
    src = str(amount) + src
    return Q_(src).to(dst).magnitude

def get_percentile(listLen,below,same):
    return ((below + same*0.5)/listLen)*100

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

    
def decider(type, question, src, dst, params, f = 2):
    splitted = params.split(' ')
    if type == 'equa' :
        return eval(params)
    elif type == 'sqrt' :
        return round(sqrt(float(question)), f)
    elif type == "obj":
        return float(question)+float(splitted[1])+float(splitted[0]);
    elif type == "sqr":
        return math.pow(float(question),float(params))
    elif type == "water":
        q = float(question)*float(splitted[1])
        full = float(splitted[0])*float(splitted[1])
        right = float(q)*float(splitted[0])
        return (right/full)
    elif type == "line":
        return round(float(params)/float(question),f)
    elif type == "angle":
        print "params",params
        if params == "inn":
            return question
        elif params == "out":
            return 360-float(question)
        else: raise Exception("wrong params when answering angle") 
    elif type == "objsVol":
        objA = json.loads(splitted[0])
        objB = json.loads(splitted[1])
        volA = get_volume(objA)
        volB = get_volume(objB)
        if volA < volB:
            raise Exception("logic error in volume of objects")
        return round(volA / volB,f)
            
    elif type in  ['curr','vol','surf', 'len']:
        concept = get_object_or_404(Concept, p1 = src, p2 = dst,
                                    type = get_object_or_404(Type,type = type))

        print "params in decider",params
        if params == "1":
            rev = True
        elif params == "0":
            rev = False
        print rev
        print concept.id
        rate = CurrTable.objects.get(concept = concept, reversed = rev).rate
        return round(rate * question,f)
    elif type  == 'temp':
        if params == "1":
            print "temp True"
            print params
            return round(converter(question, dst, src),f)
        else:
            print "temp False"
            print params
            return round(converter(question, src, dst),f)
    else :
        raise Exception('type is unknow command %s' % (type))      
    
def get_hint(request):
    if request.method == "POST" and request.is_ajax():
        post = request.POST
        
        res = decider(post.get('type'), 1, post.get('p1'), post.get('p2'), post.get('par'),5)
        print "" 
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
            print q
            if self.request.user.is_authenticated():
                user = get_user(self.request)
                try:
                    userSkill = UserSkill.objects.get(user = user,concept = q)
                except UserSkill.DoesNotExist:
                    userSkill = UserSkill(user = user, concept = q, skill = 0, number = 0)
                    userSkill.save()
            else :
                raise Exception("please log in")
            questions = ConceptQuestion.objects.filter(concept = q)
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
        e = get_object_or_404(ConceptQuestion,id = maximum[0])
        print e.concept.p1
        return e
        
    def check_type(self,*args,**kwargs):
        type = kwargs.get("type",None)
        if type not in [x.type for x in Type.objects.all()]:
            raise Exception("wrong params for type") 
        self.type = type
        
class AjaxableResponseMixin():
    def form_invalid(self, form):
        if self.request.is_ajax():
            if self.request.POST.get("skip") == "true":
               self.form_validate() 
               self.model.label = 1
               self.model.save()
               self.update_skill()
               clear_session_params(self.request,["p1","question","p2"]);
               return HttpResponse("%s//%s"%(str(self.model.label),str(self.model.result)))
           
            else:
                return HttpResponseBadRequest(json.dumps(form.errors))
    def update_skill(self):
        if self.request.user.is_authenticated():
            user = get_user(self.request)
            question = get_object_or_404(ConceptQuestion, id = self.model.conceptQuestion.id)
            userSkill = get_object_or_404(UserSkill,user = user, concept = question.concept)
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

        if abs(float(model.result)) < 0.000001 : model.result = 0.000001
        ans = model.answer
        res = model.result
        if model.type.type == "temp" :
            src = question.concept.p1
            dst = question.concept.p2
            if question.params == "1":
                print src,dst
                src, dst = dst, src
            if dst != "degC" and src == "degC":
                res = converter(model.result, dst,"degC")
                ans = converter(model.answer, dst,"degC")
        if model.type.type == "equa": model.conceptQuestion.number.number = None
        diff = float(res) - float(ans)
        diff = abs(diff)/abs(float(res))
        if diff > 1: diff = 1.0
        return diff

    def form_valid(self, form):
        if self.request.is_ajax():
            self.form_validate()
            self.model.label = self.get_proximation_error(self.model)
            self.model.save()
            self.update_skill()
            print "diff to send",self.model.label
            clear_session_params(self.request,["p1","question","p2"]);
            allTimes = sorted ([int(x.time) for x in 
                                FloatModel.objects.filter(conceptQuestion = self.model.conceptQuestion)
                                 if x.skipped == False])
            print allTimes
            if len(allTimes) == 0:
                print "okej MF"
                percentiles = 0;
            else:
                below = allTimes.index(int(self.model.time))
                counter = 0;
                for tim in allTimes:
                    if tim == self.model.time:
                        counter += 1

                percentiles = get_percentile(len(allTimes), below, counter)
                
            return HttpResponse("%s//%s//%s"%(str(self.model.label),str(self.model.result),str(percentiles)))
        
    def form_validate(self):
        self.model = FloatModel()
        self.post = self.request.POST
        self.parse_to_model()
        self.model.result = decider(self.model.type.type,
                                     self.model.conceptQuestion.number.number, 
                                     self.model.conceptQuestion.concept.p1, 
                                     self.model.conceptQuestion.concept.p2,
                                     self.model.conceptQuestion.params)

class CreateQuestion(AjaxableResponseMixin, CreateView,QuestionFunctions):
    model = FloatModel
    template_name = "learning/question.html"
    fields = ['answer']            
    def parse_to_model(self):
        js = json.loads(self.post.get('data'))

                

        self.request.session['setParam'] += 1
        t = self.post.get('type')
        type = get_object_or_404(Type, type=t)
        p1 = js['p1'] if js['p1'] != 'None' else None
        p2 = js['p2'] if js['p2'] != 'None' else None
        c = Concept.objects.get(p1 = p1, p2 = p2, type = type)
        n = get_object_or_404(Number, number=float(js['question'].replace(',','.')))

        self.model.type = type
        if self.request.user.is_authenticated():
            self.model.user = get_user(self.request)
        else :
            self.model.user = None
        print js["par"]
        print c.id
        print n.id
        self.model.conceptQuestion = get_object_or_404(ConceptQuestion, type=type, concept = c,number=n,
                                                       params = js["par"], 
                                                       hint = self.request.session["hint"])
        
        ans = self.post.get("answer")
        if ans == "":
            ans = None
        self.model.answer = ans
        self.model.time = self.post.get('time')
        if self.request.session["test"] == "set":
            inTime = False
        elif self.request.session["test"] == "time":
            print "medtime",self.request.session["medTime"] 
            print self.model.time
            if int(self.request.session["medTime"]) > int(self.model.time):
                inTime = True
            else: inTime = False
            
        if self.post.get("skip") == "true":
            self.model.skipped = True
        elif self.post.get("skip") == "false":
            self.model.skipped = False
        else:
            raise Exception("wrong param for skip %s"%self.post.get("skip"))
            
                
        self.model.inTime = inTime
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
        print "pref",preffered
        question = self.get_question(types,preffered)

        self.type = question.type.type
        test = self.kwargs.get("test",None)
        if test is None : raise Exception("no test param in url")
        pa1 = question.concept.p1
        pa2 = question.concept.p2

        q = question.number.number
        par = question.params

        self.request.session["type"] = self.type
        print "self.type",self.type
        print "hint",question.hint
        if isSettingsOn == False and self.is_new_test({"types":types,
                               "test":test,
                               "type":self.type,
                               }) :
            self.set_new_session({"types":types,
                                  "hint":question.hint,
                               "test":test,
                               "type":self.type,
                               "p1":pa1,
                              "p2":pa2,
                              "par":par,
                              "question":q,
                              "pref":preffered})
        elif self.is_new_question({"p1":pa1,
                              "p2":pa2,
                              "hint":question.hint,
                              "par":par,
                              "question":q,}):
            self.set_new_session({"p1":pa1,
                              "p2":pa2,
                              "hint":question.hint,
                              "par":par,
                              "question":q,
                              "test":test,})
        
        print "p1",self.request.session["p1"]
        print "p2",self.request.session["p2"]
        print "par",self.request.session["par"]
        print self.request.session["type"]
        if self.request.session["par"] == "1":
            ctx["pa1"]= self.request.session["p2"]
            ctx["pa2"] = self.request.session["p1"]
        else:
            ctx["pa1"] = self.request.session["p1"]
            ctx['pa2'] = self.request.session["p2"]
            
        num = Number.objects.get(number = self.request.session["question"])
        concept = Concept.objects.get(p1 = self.request.session["p1"],
                                     p2 = self.request.session["p2"],
                                     type = Type.objects.get(type = self.request.session["type"])
                                     )
        print concept.type.type
        question = ConceptQuestion.objects.get(params = self.request.session["par"],
                                               number = num,hint = self.request.session["hint"],
                                               concept = concept)
        print "hint",question.hint
        if 'medTime' not in self.request.session and self.request.session["test"] == "time":
            l = [x.time for x in FloatModel.objects.filter(conceptQuestion = question) if x.skipped == False]
            
            if len(l) == 0:
                self.request.session['medTime']=15
            else:
                self.request.session['medTime']=median(l) 
#         if self.request.session["test"] == "time":
#             ctx["fullTime"] = TIME_TEST;

        ctx["numQuestion"] = SET_TEST
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
            if "setParam" not in self.request.session:
                self.request.session['setParam'] = 0 
            self.request.session[p] = dict[p]

#             elif self.request.session["test"] == "time":
#                 self.request.session['setParam'] = 0 
#             else: 
#                 return HttpResponse(status = 401)
            
    @method_decorator(allow_lazy_user)
    def get(self,*args, **kwargs):
        if "test" in self.request.session:
#             if self.request.session["test"] == "set":
            if self.request.session["setParam"] == SET_TEST:
                return redirect("%s/finish"%self.request.path)           
#             elif self.request.session["test"] == "time" and "timeParam" in self.request.session:
#                 pass
        self.type = kwargs.get("type")
        super(CreateQuestion,self).get(*args,**kwargs)
        return render_to_response(self.template_name,self.ctx,RequestContext(self.request))

class PreffQuestion(CreateQuestion):
    @method_decorator(allow_lazy_user)
    def get(self,*args,**kwargs):
        self.pref = kwargs.get("pref",None)
        if self.pref: 
            if "prefp" in self.request.session and self.request.session["prefp"] != self.pref:
                clear_session_params(self.request)
                clear_session_params(self.request,["prefp"])
            elif "prefp" not in self.request.session:
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
    
class AllFromCategory(CreateQuestion):
    @method_decorator(allow_lazy_user)
    def get(self,*args,**kwargs):
        clear_session_params(self.request)
        cat = kwargs.get("cat",None)
        if kwargs.get("type") != "settings":
            raise Exception("no page found")
        if cat == None or cat == "home":
            raise Exception("no valid category %s"%cat)
        print "cat",cat
        typeNames = variables.mainDict['nameTypesInDb'][cat]
        types = Type.objects.filter(type__in  = typeNames)
        concepts = Concept.objects.filter(type__in = types)
        self.request.session["pref"] = concepts
        return super(AllFromCategory,self).get(*args,**kwargs)

class Finish(TemplateView):
    template_name = "learning/finish.html"
    def get_context_data(self,*args,**kwargs):
        ctx = super(Finish,self).get_context_data(*args,**kwargs)
        url = kwargs.get("url",None)
        ctx["url"] = self.url
        ctx["score"] = self.uS
        ctx["answers"] = json.dumps(self.out)
        ctx["best"] = self.best
        ctx["fastest"] = self.fastest
        ctx["test"] = self.test
        return ctx

    def get(self,*args,**kwargs):
        self.url = kwargs.get("url",None)
        if "test" not in self.request.session:
            return redirect("/learning/%s"%self.url)
        self.get_finish_result(self.request)
        return super(Finish,self).get(*args,**kwargs)
    
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
        s=0;
        f = []
        if request.session["test"] == "time":
            f = FloatModel.objects.filter(user_id = loggUser,type__in = types).order_by('-date')[:SET_TEST]
        elif request.session["test"] == "set":
            f = FloatModel.objects.filter(user_id = loggUser,type__in = types).order_by('-date')[:SET_TEST]
        if s != 1:    
            if len(f) != 0:
                s = sum([x.label for x in f])/len(f);
            else:
                raise Exception("f is 0")
        self.test = request.session["test"]
        if toDelete:
            clear_session_params(request)
        else:
            clear_session_params(request,["rev","pieTimer","p1","question",
                                           "p2","setParam","test","type","timeParam",
                                           "types"])
        types = [x.type for x in f]
        concepts = Concept.objects.filter(type__in = types)
        conceptDict = {}
        for con in concepts:
            conceptDict[con.type.type] = []
        uS = list([(x.concept.type.type, round(x.skill,2)*100) for x in 
                            UserSkill.objects.filter(user_id = loggUser, concept__in = concepts) ])
        
        for us in uS:
            conceptDict[us[0]].append(us[1])
            print us
            print "skill", us[1]
        for key in conceptDict.keys():
            conceptDict[key] = sum(conceptDict[key])/len(conceptDict[key])
        self.uS = [(x,conceptDict[x]) for x in conceptDict]
        print self.uS
        if len(f) != 0:
            scores = []
            for x in f:
                if x.skipped == False:
                    scores.append((1-x.label,x.time,x.id))
            
            if len(scores) != 0:
                self.best = [x.id for x in f].index(max(scores,key=lambda item:item[0])[2])
                self.fastest = [x.id for x in f].index(min(scores,key=lambda item:item[1])[2])
            else:
                self.best = -1
                self.fastest = -1
            results = [ob.as_json() for ob in f]
            self.out = results
        else:
            self.out = []
            self.fastest = []
            self.best = []
        


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
            return q
        typesString = variables.mainDict["nameTypesInDb"][self.t]
        types = Type.objects.filter(type__in = typesString)
        q = q.filter(type__in = types)
        return q

    def get_context_data(self,*args,**kwargs):
        ctx = super(OwnChoice, self).get_context_data(*args,**kwargs)
        if self.kwargs.get("failed",None) == "not":
            ctx["failed"] = True
        return ctx
        
    def get(self,*args,**kwargs):
        clear_session_params(self.request)
        self.t =  kwargs.get("type",None)
        if self.t == None: raise Exception
        return super(OwnChoice,self).get(*args,**kwargs)

    @method_decorator(allow_lazy_user)
    def post(self,*args,**kwargs):
        print self.request.POST
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
            if self.kwargs.get("failed"):
                return redirect("%s"%self.request.path)
            else:
                return redirect("%snot"%self.request.path)
        if self.request.POST.get("testType") in ["set","time"]:
            return redirect("/learning/own/settings/%s"%self.request.POST.get("testType"))        
        else:
            raise Exception("wrong testType")
                         
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
#         if request.session["test"] == "time":
#             if "timeParam" in request.session:
#                 Ttime = float(time) - float(request.session["timeParam"])
#                 if Ttime > TIME_TEST:
#                     #TODO: test this
#                     raise Exception("user opened closed time_test after %s sec"%TIME_SET)
#                     redirect("%s/finish"%request.path)
#             else:
#                 request.session["timeParam"] = float(time)
            
        return HttpResponse("%s//%s"%(ok,toSend))

    
def send_email(request):
    if request.method == 'POST' and request.is_ajax():
#         send_mail('Feedback: priblizne.cz', request.POST.get("data"), request.POST.get("email"),
#                   ["priblizne@googlegroups.com"], fail_silently=False)
#         return HttpResponse("1");
        to = "priblizne@googlegroups.com"
        from_email = request.POST.get("email")
        text_content = request.POST.get("data")
        msg = EmailMultiAlternatives("priblizne.cz - feedback", text_content, from_email, [to])
        msg.send()
        return HttpResponse("1");
