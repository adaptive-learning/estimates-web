import urllib2
from learning.static.python import variables
from django.core.management.base import BaseCommand, CommandError
from learning.models import *
import json
from learning.views import converter

class Command(BaseCommand):
    help = 'actualize database concepts to current state'

    def handle(self, *args, **options):
        CurrTable.objects.all().delete()
        typeCurr =  Type.objects.get(type = "curr")
        concepts= Concept.objects.filter(type = typeCurr)
        questions = ConceptQuestion.objects.filter(type = typeCurr, concept__in = concepts)
        questions = list(set([(l.concept,l.params) for l in questions]))
        raw = []
        for x in questions:
            pa1 = x[0].p1 
            pa2 = x[0].p2
            if x[1] == "1":
                print "reversed"
                pa1, pa2 = pa2, pa1
            raw.append((json.loads(urllib2.urlopen("https://query.yahooapis.com/v1/public/yql?q=select%20Rate%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22" 
                               + pa1 
                               + pa2 
                               + "%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
                                   .read())['query']['results']['rate']['Rate'],x[0].id,
                       True if x[1] == "1" else False))
            
        types = Type.objects.filter(type__in = variables.mainDict["nameTypes"]["phys"])
        concepts = Concept.objects.filter(type__in = types)
        physQuestions = ConceptQuestion.objects.filter(type__in = types, concept__in = concepts)
        physQuestions = list(set([(l.concept,l.params) for l in physQuestions]))
        for x in physQuestions:
            pa1 = x[0].p1 
            pa2 = x[0].p2 
            if x[1] == "1":
                pa1, pa2 = pa2, pa1
            raw.append((round(converter(1, pa1, pa2),5),x[0].id,
                       True if x[1] == "1" else False))
        for x in raw:
            p,created = CurrTable.objects.get_or_create(concept_id=x[1],rate = x[0], reversed = x[2])
        print "success"
        