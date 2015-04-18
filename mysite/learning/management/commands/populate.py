import json
import csv

from django.core.management.base import BaseCommand, CommandError
from learning.models import *

class Command(BaseCommand):
    args = '<poll_id poll_id ...>'
    help = 'actualize database concepts to current state'
    FloatModel.objects.all().delete()
    ConceptQuestion.objects.all().delete()
    CurrTable.objects.all().delete()
    UserSkill.objects.all().delete()
    Concept.objects.all().delete()
    Number.objects.all().delete()
    Type.objects.all().delete() 
    
    def handle(self, *args, **options):
        #angles 1
        angles = ConceptQuestion.objects.filter(type_id = 1)
        dictType={}
        with open('./raw_database_data/type.csv', 'rb') as csvfile:
            type = csv.reader(csvfile, delimiter='|')
            for row in type:
                o,c = Type.objects.get_or_create(type = row[1])
                dictType[row[0]]= int(o.id)
           
           
        with open('./raw_database_data/number.csv', 'rb') as csvfile:
            numbers = csv.reader(csvfile, delimiter='|')
            dictN = {}
            for row in numbers:
                o,c = Number.objects.get_or_create(number = float(row[1]))
                dictN[row[0]]= int(o.id) 
        
        with open('./raw_database_data/concept.csv', 'rb') as csvfile:
            dictC = {}
            concepts = csv.reader(csvfile, delimiter='|')
            for row in concepts:
                pa1 = row[1]
                pa2 = row[2]
                if pa1 == "\N":
                    pa1 = None
                if pa2 == "\N":
                    pa2 = None
                o,c = Concept.objects.get_or_create(p1 = pa1,p2 = pa2, type_id = dictType[row[3]])
                dictC[row[0]]= int(o.id)
        
        with open('./raw_database_data/conceptquestion.csv', 'rb') as csvfile:
            cqs = csv.reader(csvfile, delimiter='|')
            for row in cqs:
                if row[7] == 1 or row[7] == "1":
                    hint = True
                elif row[7] == "0" or row[7] == 0:
                    hint = False
                else:
                    raise Exception("wrong hint")
                print row[3].strip('\'')
                if row[3] == None or row[3] == "":
                    row[3] = "\"\""
                print row[3]
                o,c = ConceptQuestion.objects.get_or_create(number_id = dictN[row[1]], concept_id = dictC[row[2]],
                                                            params = str(row[3].strip('\'')), type_id = dictType[row[4]], label = float(row[5]),
                                                            updatedTimes = int(row[6]), hint = hint)
        
