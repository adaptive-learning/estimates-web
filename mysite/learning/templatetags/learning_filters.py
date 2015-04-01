from django import template
from learning.models import Type, Params, CurrTable
from learning.static.python import variables
import json

register = template.Library()

@register.filter(name='get_params')
def get_params(objects,t):
    return Params.objects.filter(type = t)

@register.filter(name='get_set_length')
def get_set_length(objects,type):
    objects = objects.filter(type = type)
    return set([x.p1 for x in objects]).length

@register.filter(name='get_from_dict')
def get_from_dict(type):
    return variables.mainDict["typeReal"][type]
    
@register.filter(name="filter_by_type")
def filter_by_type(objects,type):
    return objects.filter(type=type)

@register.filter(name='get_types')
def get_types(objects):
    return list(set([x.type for x in objects]))

@register.filter(name='get_types_CurrTable')
def get_types_CurrTable(objects):
    return list(set([x.params.type for x in objects]))

@register.filter(name='in_json')
def in_json(objects):
    return json.dumps([x.as_json() for x in objects])


@register.filter(name='get_set_p1')
def get_set_p1(objects,t):
    params = Params.objects.filter(type = t)
    return list(set([x.p1 for x in params]))

@register.filter(name="get_p2_by_p1")
def get_p2_by_p1(objects,p1):
    return list(set([x.p2 for x in objects.filter(p1=p1)]))

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


