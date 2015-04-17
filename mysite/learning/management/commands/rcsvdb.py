import json
import csv

from django.core.management.base import BaseCommand, CommandError
from learning.models import *

class Command(BaseCommand):
    args = '<poll_id poll_id ...>'
    help = 'actualize database concepts to current state'
    
    def handle(self, *args, **options):
        FloatModel.objects.all().delete()
        ConceptQuestion.objects.all().delete()
        CurrTable.objects.all().delete()
        UserSkill.objects.all().delete()
        Concept.objects.all().delete()
        Number.objects.all().delete()
        Type.objects.all().delete()
        with open('./raw_database_data/learning_type.csv', 'rb') as csvfile:
            type = csv.reader(csvfile, delimiter=',')
            dictType={}
            for row in type:
                object,created = Type.objects.get_or_create(type = row[1])
                dictType[row[0]]= int(object.id)
        with open('./raw_database_data/learning_number.csv', 'rb') as csvfile:
            question = csv.reader(csvfile, delimiter=',')
            dictQ = {}
            for row in question:
                if row[1] == '\N':
                    row[1] = None
                num = float(row[1])
                objects,created = Number.objects.get_or_create(number = num)
                dictQ[row[0]] = int(objects.id)
                
                
        typesWithConcept = Type.objects.filter(type__in = ["surf","len","temp","vol","curr"])
        if len(typesWithConcept) != 0:
            idTypesConcept= [x.id for x in typesWithConcept]
            
        else:raise Exception("no types with concept")
       
        
        

        with open('./raw_database_data/learning_concept.csv', 'rb') as csvfile:
            concepts = csv.reader(csvfile,delimiter=',')
            dictC = {}
            for row in concepts:
                if row[2] == '\N':
                    row[2] = None
                if row[1] == '-1':
                    row[1] = None
                if Type.objects.get(id = dictType[row[3]]) in typesWithConcept:
                    object, created = Concept.objects.get_or_create(type_id = dictType[row[3]], p1 = row[1], p2 = row[2])
                else:
                    object, created = Concept.objects.get_or_create(type_id = dictType[row[3]], p1 = None, p2 = None) 
                    dictC["p1%s"%row[0]] = row[1]
                    dictC["p2%s"%row[0]] = row[2]
                dictC[row[0]] = object.id

        with open('./raw_database_data/learning_params.csv', 'rb') as csvfile:
            params = csv.reader(csvfile,delimiter=',')
            dictP = {}
            for row in params:
                concept = Concept.objects.get(id = dictC[row[1]])
                if concept.p1 != None and concept.p2 != None:
                    dictP["rev%s"%row[0]] = row[2]
                dictP[row[0]] = row[1]

        with open('./raw_database_data/learning_conceptquestion.csv', 'rb') as csvfile:
            finals = csv.reader(csvfile,delimiter=',') 
            for row in finals:
                if row[6] == '1':
                    h = True 
                else: h = False 
                rowType = Type.objects.get(id = dictType[row[3]])
                if rowType in typesWithConcept:
                    o, c = ConceptQuestion.objects.get_or_create(number_id = dictQ[row[1]], type = rowType, 
                                                          params = dictP["rev%s"%row[2]],
                                                          concept_id = dictC[dictP[row[2]]],
                                                          label = float(row[4]), updatedTimes = int(row[5]), 
                                                          hint = h)
                    if c == None:
                        print "wrong"
                else:
                    p1 = dictC["p1%s"%dictP[row[2]]]
                    p2 = dictC["p2%s"%dictP[row[2]]]
                    if p1 == None and p2 == None:
                        newParam = ""
                    elif p1 == None and p2 != None:
                        newParam = p2
                    elif p1 != None and p2 == None:
                        newParam = p1
                    elif p1 != None and p2 != None:
                        newParam = p1+" "+p2
                    else:
                        raise Exception("something wront with %s %s"%p1,p2)

                    o, c = ConceptQuestion.objects.get_or_create(number_id = dictQ[row[1]], type_id = dictType[row[3]], 
                                                          params = newParam,
                                                          concept_id = dictC[dictP[row[2]]],
                                                          label = float(row[4]), updatedTimes = int(row[5]), 
                                                          hint = h)
                    if c == None:
                        print "wrong"
        

#         reversed = []
#         for x in Concept.objects.all():
#             if x.type_id not in [dictType['9'],dictType['7'],dictType['11']
#                                  ,dictType['12'],dictType['8'],dictType['10'],dictType['13']]:
#                 pa2 = x.p2
#                 pa1 = x.p1
#                 try:
#                     reverseConcept = Concept.objects.get(p1=pa2,p2=pa1)
#                     if x not in reversed:
#                         o1,c1 = Params.objects.get_or_create(concept_id = x.id,reverse = True)
#                         o,c = Params.objects.get_or_create(concept_id = x.id,reverse = False)
#                         reversed.append(reverseConcept)
#                         dictP[dictC[reverseConcept.id]] = o1.id
#                         dictP[dictC[x.id]] = o.id
#                 except Concept.DoesNotExist:
#                     o,c = Params.objects.get_or_create(concept = x, reverse = False)
#                     dictP[dictC[x.id]] = o.id
#             else:
#                 o,c = Params.objects.get_or_create(concept = x, reverse = False)
#                 dictP[dictC[x.id]] = o.id
#             
# 
#         for x in reversed:
#             x.delete()
#         with open('./raw_database_data/learning_concept.csv', 'rb') as csvfile:
#             concept = csv.reader(csvfile, delimiter=',')
#             for row in concept:
#                 ConceptQuestion.objects.get_or_create(number_id = dictQ[row[1]], type_id = dictType[row[2]], 
#                                                   params_id = dictP[row[3]],
#                                                   label = float(row[4]), updatedTimes = int(row[5]), hint = False)        
        print "success"