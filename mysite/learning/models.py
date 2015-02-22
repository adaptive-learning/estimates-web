from django.contrib.auth.models import User
from django.utils import timezone
from datetime import datetime
from django.db import models

class IntModel(models.Model):
    result = models.IntegerField(null = True)
    answer = models.IntegerField(null = True)
    type = models.CharField(max_length = 1)
    params = models.ForeignKey('Params')
    time = models.IntegerField(null = True)
    
class FloatModel(models.Model):
    question = models.FloatField(null = True)
    result = models.FloatField()
    answer = models.FloatField()
    params = models.ForeignKey('Params')
    type = models.ForeignKey('Type')
    time = models.IntegerField()
    user = models.ForeignKey(User, null = True)
    usedHint = models.BooleanField()
    label = models.FloatField(null = True)
    date = models.DateTimeField(default=timezone.localtime(timezone.now()), null = True)
    
class Params(models.Model):
    param1 = models.CharField(max_length = 20)
    param2 = models.CharField(max_length = 20)
    type = models.ForeignKey('Type')

class Type(models.Model):
    type = models.CharField(max_length = 8)
    
class UserSkill(models.Model):
    user = models.ForeignKey(User)
    skill = models.FloatField()
    type = models.ForeignKey('Type')
    
    

    