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
    params = models.ForeignKey('Params', related_name ="params")
    type = models.ForeignKey('Type')
    label = models.FloatField(null=True)

class Params(models.Model):
    p1 = models.CharField(max_length = 20)
    p2 = models.CharField(max_length = 20)
    type= models.ForeignKey("Type")

class Questions(models.Model):
    question = models.FloatField(unique = True)

class Type(models.Model):
    type = models.CharField(max_length = 8, unique = True)
    
class UserSkill(models.Model):
    user = models.ForeignKey(User)
    skill = models.FloatField()
    concept = models.ForeignKey('Params')
    number = models.IntegerField()
    date = models.DateTimeField(default=timezone.localtime(timezone.now()), null = True)
    
    

    