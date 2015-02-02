
from django.conf.urls import *

from learning import views

urlpatterns = patterns("",
    url(r'^$', views.index, name='index'),
    url(r'^conv/(?P<type>([a-z]|-)+)',views.CreateFrTo.as_view(), name = 'learning'),
    url(r'^math/(?P<type>([a-z]|-)+)',views.CreateMath.as_view()),
)    