import urllib2
from learning.static.python import variables
from django.core.management.base import BaseCommand, CommandError
from learning.models import *
import json
from learning.views import converter

class Command(BaseCommand):
    help = 'actualize database concepts to current state'

    def handle(self, *args, **options):
        curr = Params.objects.filter(type = Type.objects.get(type = "curr"))
        raw = [(json.loads((urllib2.urlopen("https://query.yahooapis.com/v1/public/yql?q=select%20Rate%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22" 
                               + x.p1 
                               + x.p2 
                               + "%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")).read())['query']['results']['rate']['Rate'],x.id)
               for x in curr]
        print raw
        types = Type.objects.filter(type__in = variables.mainDict["nameTypes"]["phys"])
        physParams = Params.objects.filter(type__in = types)
        raw += [(round(converter(1, x.p1, x.p2),5),x.id) for x in physParams]
        for x in raw:
            p,created = CurrTable.objects.get_or_create(params_id=x[1],rate = x[0])
        print "success"
        