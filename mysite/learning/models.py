from django.contrib.auth.models import User
from django.utils import timezone
from datetime import datetime
from django.db import models


    
class FloatModel(models.Model):
    result = models.FloatField()
    answer = models.FloatField()
    concept = models.ForeignKey('Concept')
    type = models.ForeignKey('Type')
    time = models.IntegerField()
    user = models.ForeignKey(User, null = True)
    usedHint = models.BooleanField()
    label = models.FloatField(null = True)
    date = models.DateTimeField(default=timezone.localtime(timezone.now()), null = True)


    
class Concept(models.Model):
    question = models.ForeignKey('Questions');
    param1 = models.ForeignKey('Params', null = True)
    param2 = models.ForeignKey('Params', null = True,related_name = "param2")
    type = models.ForeignKey('Type')

class Params(models.Model):
    param = models.CharField(max_length = 20, unique = True)

class Questions(models.Model):
    question = models.FloatField(unique = True)

class Type(models.Model):
    type = models.CharField(max_length = 8, unique = True)
    
class UserSkill(models.Model):
    user = models.ForeignKey(User)
    skill = models.FloatField()
    type = models.ForeignKey('Type')
    
    

    