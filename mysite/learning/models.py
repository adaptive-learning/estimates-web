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
    inTime = models.BooleanField()
    skipped = models.BooleanField()
    
    def as_json(self):
        n = get_object_or_404(Number,id = self.conceptQuestion.number.id)
        t = get_object_or_404(Type,id = self.type.id)
        pa1 = self.conceptQuestion.concept.p1
        pa2 = self.conceptQuestion.concept.p2
        if self.conceptQuestion.params == True:
            pa1, pa2 = pa2, pa1
        return dict(
            time=self.time, 
            label=self.label,
            a = self.answer,
            p1 = pa1,
            p2 = pa2,
            params = self.conceptQuestion.params,
            q = n.number,
            type = t.type, 
            right = self.result,
            skipped = self.skipped,
            inTime = self.inTime,
            )
            
class ConceptQuestion(models.Model):
    number = models.ForeignKey('Number',null=True);
    concept = models.ForeignKey('Concept', related_name ="concept")
    params = models.CharField(max_length = 40, null = True) 
    type = models.ForeignKey('Type')
    label = models.FloatField(null=True)
    updatedTimes = models.IntegerField(default = 0)
    hint = models.BooleanField()

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
    concept = models.ForeignKey('Concept')
    reversed = models.BooleanField()
    rate = models.FloatField()

class Concept(models.Model):
    p1 = models.CharField(max_length = 20, null = True)
    p2 = models.CharField(max_length = 20,null = True)
    type= models.ForeignKey("Type")
    
