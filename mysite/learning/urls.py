
from django.conf.urls import *

from learning import views

urlpatterns = patterns("",
    url(r'^$', views.index, name='index'),
    url(r'assig/$',views.MAssig, name='math/assig'),
    url(r'answeredMath',views.answeredMath, name='math/assig/asnweredMath'),
    url(r'answeredCurr',views.answeredCurr, name='math/assig/asnweredCurr'),

    url(r'^e',views.Currency,{'curr':'EUR'}),
    url(r'^c',views.Currency,{'curr':'CZK'}),
#     url(r'e',views.Currency,'EUR',name),
#     url(r'c',views.Currency,'CZK',name="czk"),
)    