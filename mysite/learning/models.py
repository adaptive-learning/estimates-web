from django.contrib.auth.models import User
from django.utils import timezone
from datetime import datetime
from django.db import models
from django.shortcuts import get_object_or_404

    
class FloatModel(models.Model):
    result = models.FloatField()
    answer = models.FloatField()
    concept = models.ForeignKey('Concept')
    type = models.ForeignKey('Type')
    time = models.IntegerField()
    user = models.ForeignKey(User, null = True)
    usedHint = models.BooleanField()
    label = models.FloatField(null = True)
    date = models.DateTimeField(auto_now=True)
    
    def as_json(self):
        par = get_object_or_404(Params,id = self.concept.params.id)
        q = get_object_or_404(Questions,id = self.concept.question.id)
        t = get_object_or_404(Type,id = self.type.id)
        return dict(
            time=self.time, 
            label=self.label,
            a = self.answer,
            p1 = par.p1,
            p2 = par.p2,
            q = q.question,
            type = t.type, 
            )
            
class Concept(models.Model):
    question = models.ForeignKey('Questions');
    params = models.ForeignKey('Params', related_name ="params")
    type = models.ForeignKey('Type')
    label = models.FloatField(null=True)
    updatedTimes = models.IntegerField(default = 0)

class Params(models.Model):
    p1 = models.CharField(max_length = 20)
    p2 = models.CharField(max_length = 20,null = True)
    type= models.ForeignKey("Type")
    def as_json(self):
        return dict(
                    p1 = self.p1,
                    p2 = self.p2,
                    )
class Questions(models.Model):
    question = models.FloatField(unique = True)

class Type(models.Model):
    type = models.CharField(max_length = 8, unique = True)
    
class UserSkill(models.Model):
    user = models.ForeignKey(User)
    skill = models.FloatField()
    concept = models.ForeignKey('Params')
    number = models.IntegerField()
    date = models.DateTimeField(auto_now=True)
    
    

    