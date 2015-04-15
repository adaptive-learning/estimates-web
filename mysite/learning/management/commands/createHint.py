import json
import csv

from django.core.management.base import BaseCommand, CommandError
from learning.models import *

class Command(BaseCommand):
    args = '<poll_id poll_id ...>'
    help = 'actualize database concepts to current state'
    
    def handle(self, *args, **options):
        types = Type.objects.filter(type__in = ["curr","len","surt","temp","vol"])
        concepts = Concept.objects.filter(type__in = types)
        params = Params.objects.filter(concept__in = concepts)
        for p in params:
            questions = ConceptQuestion.objects.filter(params = p)
            numbers = sorted([x.number.number for x in questions])
            percent = (int(len(numbers)*15)/100)
            percent = numbers[:percent]
            Numbers = Number.objects.filter(number__in = percent)
            questions = questions.filter(number__in = Numbers)
            for q in questions:
                try:
                    newQ = ConceptQuestion.objects.get(hint = True, number = q.number, params = q.params,
                                                     type = q.type)
                except ConceptQuestion.DoesNotExist:
                    newQ = ConceptQuestion(hint = True, number = q.number, params = q.params,
                                                     type = q.type, label = 0.5, updatedTimes = 0)
                    newQ.save()