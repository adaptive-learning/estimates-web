import csv
import json
from optparse import make_option

from django.core.management.base import BaseCommand, CommandError
from learning.models import *
def frange(x, y, jump):
    while x < y:
        yield x
        x += jump
class Command(BaseCommand):
    args = '<poll_id poll_id ...>'
    help = 'please insert options in this order: type, param1, param2, params, number'
    option_list = BaseCommand.option_list + (
        make_option('--to',
            dest = "to",
            ),

        make_option('--step',
            dest = "step",
            ),
        make_option("--hinted",
            action = 'store_true',
            dest = "hint",
            ),

        )

            
    def handle(self, *args, **options):
        if len(args) == 5:
            type,created = Type.objects.get_or_create(type = args[0])
            if args[2].lower() in ["none","null"]:
                pa2 = None
            else:
                pa2 = args[2]
            if args[1].lower() in ["none","null"]:
                pa1 = None
            else:
                pa1 = args[1]

            if args[3] == 'False':
                params = False
            elif args[3] == 'True':
                params = True
            else: params = args[3] 

            concept, created = Concept.objects.get_or_create(p1 = pa1, p2 = pa2, type = type)
            if args[4].lower() in ["none","null"]:
                num = -1 
            else:
                num = float(args[4])

#             if options["hint"] != None:
#                 if options["hint"]:
            if options['to'] != None and num != None:
                if options['step'] == None:
                    step = 1
                else :
                    step = float(options['step'])
                for i in frange(num, float(options['to']),step):
                    number, created = Number.objects.get_or_create(number = i)
                    try:
                        cq = ConceptQuestion.objects.get(type = type, concept = concept, params = params,
                                                         number = number)
                    except ConceptQuestion.DoesNotExist:
                        cq = ConceptQuestion(type = type, params = params, concept = concept,
                                             number= number, 
                                             label = 0.5, updatedTimes = 0, hint = False)
                        cq.save()
            else:
                number, created = Number.objects.get_or_create(number = -1)
                try:
                    cq = ConceptQuestion.objects.get(type = type, params = params, concept = concept,
                                                      number = number)
                except ConceptQuestion.DoesNotExist:
                    cq = ConceptQuestion(type = type, params = params, number= number, 
                                         concept = concept,
                                         label = 0.5, updatedTimes = 0, hint = False)
                    cq.save() 
                
                    
                  
            print "success"
        else:
            print "failed not enough args"
