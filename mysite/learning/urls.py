from django.conf.urls import patterns, url

from learning import views

urlpatterns = patterns("",
    url(r'^$', views.index, name='index'),
    url(r'assig/$',views.MAssig, name='math/assig'),
)