
from django.conf.urls import *

from learning import views
from learning.views import *

urlpatterns = patterns("",
    url(r'^$', views.index, name='index'),
    url(r'^curr/(?P<type>[a-z]+)',CreateFrTo.as_view()),
    url(r'^phys/(?P<type>[a-z]+)',CreateFrTo.as_view()),
    url(r'^math/(?P<type>[a-z]+)',CreateMath.as_view()),
)    