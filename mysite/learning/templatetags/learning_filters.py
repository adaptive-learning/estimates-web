from django import template
from learning.models import Type, Params, CurrTable, Concept
from learning.static.python import variables
import json

register = template.Library()

@register.filter(name='get_concepts')
def get_concepts(objects,t):
    return objects.filter(type = t)

@register.filter(name='get_params')
def get_params(objects,t):
    concepts = Concept.objects.filter(type = t)
    return Params.objects.filter(concept__in = concepts)

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

@register.filter(name='get_reversed')
def get_reversed(param,object):
    print object["reverse"]
    if object["reverse"]:
        if param == object["p1"]:
            return object["p2"]
        elif param == object["p2"]:
            return object["p1"]
        return object.param
    else: return param
        
@register.filter(name='get_types_CurrTable')
def get_types_CurrTable(objects):
    return list(set([x.params.concept.type for x in objects]))

@register.filter(name='in_json')
def in_json(objects):
    return json.dumps([x.as_json() for x in objects])


@register.filter(name='get_set_p1')
def get_set_p1(objects,t):
    concept = Concept.objects.filter(type = t)
    params = Params.objects.filter(concept = concept) 
    return list(set([x.concept.p2 if x.reverse else x.concept.p1 for x in params]))

@register.filter(name="get_p2_by_p1")
def get_p2_by_p1(objects,pa1):
    out = []    
    for x in objects:
        if x.reverse:
            if x.concept.p2 == pa1:
                out.append(x.concept.p1)
        else:
            if x.concept.p1 == pa1:
                out.append(x.concept.p2)
    return out

@register.filter(name='firstP')
def firstP(objects, first):
#     out = []
#     for x in objects:
#         if x.params.reverse:
#             if x.params.concept.p2 == first:
#                 out.append(x)
#         else:
#             if x.params.concept.p1 == first:
#                 out.append(x)
#     return out
    concept = Concept.objects.filter(p1 = first) | Concept.objects.filter(p2 = first)
    params = Params.objects.filter(concept__in = concept)
    return objects.filter(params__in = params)

    
@register.filter(name='secondP')
def secondP(objects, second):
    for x in objects:
        if x.params.reverse:
            if x.params.concept.p1 == second:
                return x.rate
        else:
            if x.params.concept.p2 == second:
                return x.rate
            
    
    
#     for x in objects:
#         if x.para
#     concept = Concept.objects.filter(p2 = )
#     rev = False
#     if len(concept) == 0:
#         concept = Concept.objects.filter(p2 = first)
#         rev = True
#     
#     params = Params.objects.filter(concept__in = concept, reverse = rev)
#     return objects.filter(params__in = params)

#     concepts = Concept.objects.filter(p1 = second) | Concept.objects.filter(p2 = second)
#     params = Params.objects.filter(concept__in = concepts)
#     return objects.filter(params__in = params)
#     try:
#         params = [e for e in  Params.objects.filter(p2 = second)]
#         try:
#             obj = objects.get(params__in  = params)
#         except: return "-"
#             
#         return obj.rate
#     except CurrTable.DoesNotExist:
#         if objects[0].params.p1 == second:
#             return "1"


