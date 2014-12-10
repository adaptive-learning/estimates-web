from django.db import models

class MathExerciseModel(models.Model):
    result = models.IntegerField()
    answer = models.IntegerField()
    equation = models.CharField(max_length = 20)
    max = 10
    
class MathSqrtModel(models.Model):
    result = models.FloatField()
    answer = models.FloatField()
    
    
class CurrencyModel(models.Model):
    result = models.FloatField()
    answer = models.FloatField()
    fr = models.CharField(max_length=4)
    to = models.CharField(max_length=4)
