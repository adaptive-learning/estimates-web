# from django import forms
# # from django.forms import *
from learning.models import FloatModel, Concept
from django.db.models import fields
from django.db import models

# class IntForm(forms.ModelForm):
#     class Meta:
#         model = IntModel
#         fields['Answer']
# #     answer = forms.IntegerField()
# # 
# class FloatForm(forms.ModelForm):
# #     pass
# #     answer = forms.FloatField()
#     class Meta:
#         model = FloatModel
#         fields = ['answer']
#         widgets = {
#             'answer': forms.TextInput(
#                 attrs={'id': 'input', 'name':"ans", 'placeholder':"write an answer here", 'step':"0.01", 'min':"0"}
#                   
#             ),
#         }
        
        
class JsonSerializable(models.Model):
    def __init__(self,label,time,a,q,p1,p2,type):
            
            self.answer = a
            self.type = type
            self.time = time
            self.label = label
            self.p1 = p1
            self.p2 = p2
            self.question = q
    answer = models.FloatField()
    type = models.CharField(max_length = 8)
    time = models.IntegerField()
    label = models.FloatField(null = True)
    p1 = models.CharField(max_length = 20)
    p2 = models.CharField(max_length = 20,null = True)
   