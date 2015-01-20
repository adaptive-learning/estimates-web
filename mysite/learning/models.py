from django.db import models

class MathExerciseModel(models.Model):
    result = models.IntegerField(null = True)
    answer = models.IntegerField(null = True)
    equation = models.CharField(max_length = 20)
    time = models.IntegerField(null = True)
    
class MathSqrtModel(models.Model):
    result = models.FloatField(null = True)
    answer = models.FloatField(null = True)
    question = models.IntegerField()
    oper = models.CharField(max_length = 1)
    pow = models.IntegerField(null = True)
    time = models.IntegerField(null = True)
    
class CurrencyModel(models.Model):
    result = models.FloatField(null = True)
    answer = models.FloatField(null = True)
    question = models.FloatField()
    fr = models.CharField(max_length=4)
    to = models.CharField(max_length=4)
    time = models.IntegerField(null = True)

class PhysicsModel(models.Model):
    result = models.FloatField(null = True)
    answer = models.FloatField(null = True)
    fr = models.CharField(max_length=4)
    to = models.CharField(max_length=4)
    type = models.CharField(max_length = 1)
    time = models.IntegerField(null = True)

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
    
class Params(models.Model):
    param1 = models.CharField(max_length = 20)
    param2 = models.CharField(max_length = 20)
    
class Type(models.Model):
    type = models.CharField(max_length = 8)

    