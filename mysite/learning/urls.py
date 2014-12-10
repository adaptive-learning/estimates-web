
from django.conf.urls import *

from learning import views

urlpatterns = patterns("",
    url(r'^$', views.index, name='index'),
    url(r'assig/$',views.MAssig, name='math/assig'),
    url(r'answeredMath',views.answeredMath, name='math/assig/asnweredMath'),
    url(r'answeredCurr',views.answeredCurr, name='math/assig/asnweredCurr'),
    url(r'sqrt',views.MSqrt,name="math/assig/sqrt"),
    url(r'^e',views.Currency,{'curr':'EUR'}),
    url(r'^c',views.Currency,{'curr':'CZK'}),
)    