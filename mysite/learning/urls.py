
from django.conf.urls import *

from learning import views

urlpatterns = patterns("",
    url(r'^$', views.index, name='index'),
    url(r'assig/$',views.MAssig, name='math/assig'),
    url(r'answeredMath',views.answeredMath, name='math/assig/asnweredMath'),
    url(r'ansCurr',views.ansCurr, name='curr/ansCurr'),
    url(r'sqrt',views.MSqrt,name="math/sqrt"),
    url(r'ansSqrt',views.ansSqrt,name="math/ansSqrt"),
    url(r'^e',views.Currency,{'curr':'EUR'}),
    url(r'^c',views.Currency,{'curr':'CZK'}),
)    