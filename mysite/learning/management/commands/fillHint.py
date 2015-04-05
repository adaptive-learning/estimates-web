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
            tenPercent = int(len(numbers)/(100/20))
            tenPercent = numbers[:tenPercent]
            Numbers = Number.objects.filter(number__in = tenPercent)
            questions = questions.filter(number__in = Numbers)
            for q in questions:
                Hint.objects.get_or_create(conceptQuestion = q)
            