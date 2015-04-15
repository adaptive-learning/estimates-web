from django.contrib.auth.models import User
from django.utils import timezone
from datetime import datetime
from django.db import models
from django.shortcuts import get_object_or_404

    
class FloatModel(models.Model):
    result = models.FloatField()
    answer = models.FloatField()
    conceptQuestion = models.ForeignKey('ConceptQuestion')
    type = models.ForeignKey('Type')
    time = models.IntegerField()
    user = models.ForeignKey(User, null = True)
    label = models.FloatField(null = True)
    date = models.DateTimeField(auto_now=True)
    
    def as_json(self):
        par = get_object_or_404(Params,id = self.conceptQuestion.params.id)
        n = get_object_or_404(Number,id = self.conceptQuestion.number.id)
        t = get_object_or_404(Type,id = self.type.id)
        pa1 = par.concept.p1
        pa2 = par.concept.p2
        if par.reverse:
            pa1, pa2 = pa2, pa1
        return dict(
            time=self.time, 
            label=self.label,
            a = self.answer,
            p1 = pa1,
            p2 = pa2,
            q = n.number,
            type = t.type, 
            )
            
class ConceptQuestion(models.Model):
    number = models.ForeignKey('Number',null=True);
    params = models.ForeignKey('Params', related_name ="params")
    type = models.ForeignKey('Type')
    label = models.FloatField(null=True)
    updatedTimes = models.IntegerField(default = 0)
    hint = models.BooleanField()

class Params(models.Model):
    concept = models.ForeignKey("Concept")
    reverse = models.BooleanField()
       
    def as_json(self):
        if reverse:
            return dict(
                        p1 = concept.p2,
                        p2 = concept.p1,
                        )
        else :
            return dict(
                        p1 = concept.p1,
                        p2 = concept.p2,
                        )
class Number(models.Model):
    number = models.FloatField(unique = True)

class Type(models.Model):
    type = models.CharField(max_length = 8, unique = True)
    
class UserSkill(models.Model):
    user = models.ForeignKey(User)
    skill = models.FloatField()
    concept = models.ForeignKey('Concept')
    number = models.IntegerField()
    
class CurrTable(models.Model):
    params = models.ForeignKey('Params')
    rate = models.FloatField()

class Concept(models.Model):
    p1 = models.CharField(max_length = 20)
    p2 = models.CharField(max_length = 20,null = True)
    type= models.ForeignKey("Type")
    
