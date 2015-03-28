from django import template
from learning.models import Type
from learning.static.python import variables
import json

register = template.Library()


@register.filter(name='get_set_params')
def get_set_params(objects,type):
    objects = objects.filter(type = type)
    return list(set([x.p1 for x in objects]))

@register.filter(name='get_set_length')
def get_set_length(objects,type):
    objects = objects.filter(type = type)
    return set([x.p1 for x in objects]).length

@register.filter(name='get_from_dict')
def get_from_dict(type):
    return variables.mainDict["typeReal"][type]
    

@register.filter(name='get_types')
def get_types(objects):
    q = list(set([x.type for x in objects]))
    already = False
    out = []
    for x in q:
        t = x.type
        print "t-",t
        out.append(x)
    return out
        
@register.filter(name='in_json')
def in_json(objects):
    return json.dumps([x.as_json() for x in objects])
