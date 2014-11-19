from django.db import models

class MathExercise(models.Model):
    result = models.IntegerField();
    answer = models.IntegerField();