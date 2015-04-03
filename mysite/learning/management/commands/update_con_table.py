import urllib2
from learning.static.python import variables
from django.core.management.base import BaseCommand, CommandError
from learning.models import *
import json
from learning.views import converter

class Command(BaseCommand):
    help = 'actualize database concepts to current state'

    def handle(self, *args, **options):
        concepts= Concept.objects.filter(type = Type.objects.get(type = "curr"))
        curr = Params.objects.filter(concept__in = concepts)
        print len(curr)
        raw = []
        for x in curr:
            pa1 = x.concept.p1 
            pa2 = x.concept.p2
            if x.reverse:
                print "reversed"
                pa1, pa2 = pa2, pa1
            raw.append((json.loads(urllib2.urlopen("https://query.yahooapis.com/v1/public/yql?q=select%20Rate%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22" 
                               + pa1 
                               + pa2 
                               + "%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").read())['query']['results']['rate']['Rate'],x.id))

        types = Type.objects.filter(type__in = variables.mainDict["nameTypes"]["phys"])
        concepts = Concept.objects.filter(type__in = types)
        physParams = Params.objects.filter(concept__in = concepts)
        for x in physParams:
            pa1 = x.concept.p1 
            pa2 = x.concept.p2
            if x.reverse:
                pa1, pa2 = pa2, pa1
            raw.append((round(converter(1, pa1, pa2),5),x.id))
        for x in raw:
            p,created = CurrTable.objects.get_or_create(params_id=x[1],rate = x[0])
        print "success"
        