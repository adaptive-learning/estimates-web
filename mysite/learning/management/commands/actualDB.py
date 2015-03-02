from django.core.management.base import BaseCommand, CommandError
from learning.models import *

Types=["e","c","vol","surf","len","temp","equa","sqrt","angle","water"];
TypeParams = {'e': ["USD", "PLN", "HUF", "CHF", "GBP", "RUB", "CZK"],
              'c': ["USD", "PLN", "HUF", "CHF", "GBP", "RUB", "EUR"],
              'vol': ["mm**3", "cm**3", "dm**3", "m**3", "km**3", "ml", "l", "dl", "hl"],
              'surf': ["mm**2", "cm**2", "dm**2", "m**2", "km**2", "are", "acre"],
              'len': ["mm", "cm", "dm", "m", "km", "mile", "inch", "ft"],
              'temp':["kelvin", "degF", "degC"],
             }
allParams = ["EUR","USD","PLN","HUF","CHF","GBP","RUB","CZK","kelvin", "degF", "degC", "cm",
              "dm", "m", "km", "mile", "inch","ft", "cm**2", "dm**2", "m**2", "km**2", 'ft**2', "mile**2", "inch**2","pint",
              "yard","yard**2","inch**3","ft**3","yard**3","cup","tbsp", "quart", "inn","out",
               "are", "acre","cm**3", "dm**3", "m**3", "km**3", "ml", "l", "dl", "hl",
               
           ]
    


ParamsSET={
        "e":[
             ["1",["EUR","USD","PLN","HUF","CHF","GBP","RUB","CZK"],[10,60,2]]
             ],
        "c":[
             ["1",["CZK","USD","PLN","HUF","CHF","GBP","RUB","EUR"],[300,1600,38]]
             ],
        }

class Command(BaseCommand):
    args = '<poll_id poll_id ...>'
    help = 'actualize database concepts to current state'

    def handle(self, *args, **options):
        for i in allParams:
            Params.objects.get_or_create(param=i)
        for i in Types:
            Type.objects.get_or_create(type = i)
        for i in ParamsSET.keys():
            t = Type.objects.get(type = i)
            par = ParamsSET.get(i)[0]
            fr = par[1].pop(0)
            fr = Params.objects.get(param=fr);
            for x in par[1]:
                to = Params.objects.get(param=x);
                for r in range(par[2][0], par[2][1], par[2][2]):
                    q = Questions.objects.get_or_create(question=float(r))[0]
                    Concept.objects.get_or_create(type = t,param1 = fr, param2=to, question=q)    
        print "success"