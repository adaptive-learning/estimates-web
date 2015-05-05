from django.contrib.auth.models import User
from django.utils import timezone
from datetime import datetime
from django.db import models
from django.shortcuts import get_object_or_404


#    user answer
class FloatModel(models.Model):
    #    right answer
    result = models.FloatField(null = True)
    #    user answer
    answer = models.FloatField(null = True)
    #    question
    conceptQuestion = models.ForeignKey('ConceptQuestion')
    #    category of question
    type = models.ForeignKey('Type')
    #    time of user Answer
    time = models.FloatField()
    #    user Id
    user = models.ForeignKey(User, null = True)
    #    user succces of answer
    label = models.FloatField(null = True)
    #    date of user answer
    date = models.DateTimeField(auto_now=True)
    #    if user made his answer in Time in test on time
    timer = models.FloatField(null = True)
    #    if user skipped answer
    skipped = models.BooleanField()
    
    def as_json(self):
        n = get_object_or_404(Number,id = self.conceptQuestion.number.id)
        t = get_object_or_404(Type,id = self.type.id)
        pa1 = self.conceptQuestion.concept.p1
        pa2 = self.conceptQuestion.concept.p2
        if self.timer:
            if self.timer >= self.time:
                success = True
            else: success = False
        else:
            success = None;
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
            inTime = success,
            )
            
#    question
class ConceptQuestion(models.Model):
    #    question in number if neeeded
    number = models.ForeignKey('Number',null=True);
    #    concept of question
    concept = models.ForeignKey('Concept', related_name ="concept")
    #    parameters for specifing things 
    params = models.CharField(max_length = 40, null = True) 
    #    type of question
    type = models.ForeignKey('Type')
    #    difficulty of question
    label = models.FloatField(null=True)
    #    how many times question was answered
    updatedTimes = models.IntegerField(default = 0)
    #    if question contains hint
    hint = models.BooleanField()

#    question in float 
class Number(models.Model):
    number = models.FloatField(unique = True)

#    category
class Type(models.Model):
    #    category in string
    type = models.CharField(max_length = 8, unique = True)

#    skill of user
class UserSkill(models.Model):
    #    user id
    user = models.ForeignKey(User)
    #    skill of user
    skill = models.FloatField()
    #    concept for skill
    concept = models.ForeignKey('Concept')
    #    deleted  but can be used for counting
    number = models.IntegerField()
    
#    table of currency rating
class CurrTable(models.Model):
    #    concept
    concept = models.ForeignKey('Concept')
    #    is reversed concept
    reversed = models.BooleanField()
    #    rate from 1 variable to another variable
    rate = models.FloatField()

#    concept
class Concept(models.Model):
    #    from
    p1 = models.CharField(max_length = 20, null = True)
    #    to
    p2 = models.CharField(max_length = 20,null = True)
    #    type of question
    type= models.ForeignKey("Type")
    
