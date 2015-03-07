from django.core.management.base import BaseCommand, CommandError
from learning.models import *

class Command(BaseCommand):
    args = '<poll_id poll_id ...>'
    help = 'actualize database concepts to current state'

    def handle(self, *args, **options):
#         filtered = set([(x.param1.param,x.param2.param,x.type) for x in Concept.objects.all()])
#         for x in filtered:
#             p,created = Params.objects.get_or_create(p1 = x[0], p2 = x[1],type = x[2], param="new")
#         for x in Concept.objects.all():
# #             print "e",x.param1.param
# #             print "an",x.param2.param
#             p1 = Params.objects.get(param = x.param1.param)
#             p2 = Params.objects.get(param = x.param2.param)
# 
#             par = Params.objects.get(p1 = p1.param,p2=p2.param, param = "new")
#             x.params = par
#             x.save()
        print "success"