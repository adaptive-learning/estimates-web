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
    
class Params(models.Model):
    param1 = models.CharField(max_length = 20)
    param2 = models.CharField(max_length = 20)
    
class Type(models.Model):
    type = models.CharField(max_length = 8)

    