from django.db import models

class MathExerciseModel(models.Model):
    result = models.IntegerField(null = True)
    answer = models.IntegerField(null = True)
    equation = models.CharField(max_length = 20)
    max = 10
    
class MathSqrtModel(models.Model):
    result = models.FloatField(null = True)
    answer = models.FloatField(null = True)
    question = models.IntegerField()
    oper = models.CharField(max_length = 1)
    pow = models.IntegerField(null = True)
    
class CurrencyModel(models.Model):
    result = models.FloatField(null = True)
    answer = models.FloatField(null = True)
    question = models.FloatField()
    fr = models.CharField(max_length=4)
    to = models.CharField(max_length=4)

class PhysicsModel(models.Model):
    result = models.FloatField(null = True)
    answer = models.FloatField(null = True)
    fr = models.CharField(max_length=4)
    to = models.CharField(max_length=4)
    type = models.CharField(max_length = 1)
    