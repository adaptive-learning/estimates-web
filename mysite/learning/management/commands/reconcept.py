import json
import csv

from django.core.management.base import BaseCommand, CommandError
from learning.models import *

class Command(BaseCommand):
    args = '<poll_id poll_id ...>'
    help = 'actualize database concepts to current state'
    
    def handle(self, *args, **options):
        #angles 1
        angles = ConceptQuestion.objects.filter(type_id = 1)
        
        