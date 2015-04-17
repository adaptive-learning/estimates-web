from decimal import Decimal
from django import template
from django.utils.translation import ugettext as _
from learning.models import Type, CurrTable, Concept
from learning.static.python import variables
import json

register = template.Library()

@register.filter(name='get_concepts')
def get_concepts(objects,t):
    return objects.filter(type = t)

@register.filter(name="hint")
def hint(id):
    return True if len(Hint.objects.filter(conceptQuestion_id = id)) != 0 else False

@register.filter(name='filter_by_type')
def filter_by_type(objects,t):
    concepts = Concept.objects.filter(type = t)
    return objects.filter(concept__in = concepts)

@register.filter(name='get_set_length')
def get_set_length(objects,type):
    objects = objects.filter(type = type)
    return set([x.p1 for x in objects]).length

@register.filter(name="json_from_dict")
def json_from_dict(main):
    out = {}
    for f in variables.mainDict[main].keys():
        inner = variables.mainDict[main][f]
        if isinstance(inner, (str, unicode)):
            try:
                out[f] = _(inner)
            except KeyError:
                out[f] = inner
        else:
            inInner = []
            for x in inner:
                try:
                    inInner.append(_(x))
                except KeyError:
                    inInner.append(x)
            out[f] = inInner

    return  json.dumps(out)
        
    return json.dumps(variables.mainDict[main])

@register.filter(name='get_from_dict')
def get_from_dict(type,main):
    try:
        out = variables.mainDict[main][type]
        if isinstance(out, (str, unicode)):
            return _(out)
        lis = []
        for x in out:
           lis.append(_(x))
        return lis
    except KeyError:
        return False

@register.filter(name="get_n_element")
def get_n_element(objects,n):
    return objects[n]

@register.filter(name='get_keys_from_dict')
def get_keys_from_dict(type):
    try:
        out = variables.mainDict[type].keys()
        return sorted(out,reverse=True)
    except KeyError:
        return False

@register.filter(name="filter_by_type")
def filter_by_type(objects,t):
    concepts = Concept.objects.filter(type = t)
    return objects.filter(concept__in = concepts) 

@register.filter(name='get_types')
def get_types(objects):
    return list(set([x.type for x in objects]))

@register.filter(name='get_types_CurrTable')
def get_types_CurrTable(objects):
    return list(set([x.concept.type for x in objects]))

@register.filter(name='in_json')
def in_json(objects):
    return json.dumps([x.as_json() for x in objects])


@register.filter(name='get_set_p1')
def get_set_p1(objects,t):
    concepts = Concept.objects.filter(type = t)
    filtered = objects.filter(concept__in = concepts)
    return list(set([x.concept.p2 if x.reversed else x.concept.p1 for x in filtered]))
            


@register.filter(name="get_p2_by_p1")
def get_p2_by_p1(objects,pa1):
    out = []    
    for x in objects:
        if x.reversed:
            if x.concept.p2 == pa1:
                out.append(x.concept.p1)
        else:
            if x.concept.p1 == pa1:
                out.append(x.concept.p2)
    return out

@register.filter(name='firstP')
def firstP(objects, first):
    concepts = Concept.objects.filter(p1 = first) | Concept.objects.filter(p2 = first)
    return objects.filter(concept__in = concepts)

    
@register.filter(name='secondP')
def secondP(objects, second):

    for x in objects:
        if x.reversed:
            if x.concept.p1 == second:
                return "%.5f"%x.rate
        else:
            if x.concept.p2 == second:
                return "%.5f"%x.rate
            
