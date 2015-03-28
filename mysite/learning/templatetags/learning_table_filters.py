
import re
from django import template
from learning.models import Type, Params, CurrTable
from learning.static.python import variables
import json

register = template.Library()
SUBSTRING_THAT_NEVER_OCCURS = '#f4x@SgXXmS'



@register.filter(name='get_set_p1')
def get_set_p1(objects,t):
    params = Params.objects.filter(type = t)
    return list(set([x.p1 for x in params]))

@register.filter(name='get_set_p2')
def get_set_p2(objects,t):
    params = Params.objects.filter(type = t)
    return list(set([x.p2 for x in params]))

@register.filter(name='get_types')
def get_params(objects,type):
    return list(set([x.params for x in objects]))

@register.filter(name='get_rate')
def delete(first):
    return first/10
@register.filter(name='firstP')
def firstP(objects, first):
    print first
    print [e.p2 for e in  Params.objects.filter(p1 = first)]
    return objects.filter(params__in = Params.objects.filter(p1 = first))

@register.filter(name='secondP')
def secondP(objects, second):
    try:
        params = [e for e in  Params.objects.filter(p2 = second)]
        try:
            obj = objects.get(params__in  = params)
        except: return "-"
            
        return obj.rate
    except CurrTable.DoesNotExist:
        if objects[0].params.p1 == second:
            return "1"
@register.filter(name='get_from_dict')
def get_from_dict(type):
    return variables.mainDict["typeReal"][type]
    
@register.filter(name='get_types')
def get_types(objects):
    return list(set([x.params.type for x in objects]))