
from django.conf.urls import *
from django.views.generic import TemplateView
from learning import views

urlpatterns = patterns("",
    url(r'^$', views.index, name='index'),
    url(r'^get_hint',views.get_hint,name="hint"),
#     url(r'nextQ',views.NextQuestion.as_view(),name = "nextQuestion"),
    url(r'^finish',views.finish,name= "last"),
#     url(r'^getFromDict',views.getFromDict),
    url(r'^clear_session',views.clearSession, name="clear"),
    url(r'^all-all',views.random_redirect),
    url(r'table',views.ShowTable.as_view()),
    url(r'^conv/(?P<pref>[A-Z]+)/(?P<type>([a-z]|-)+)/(?P<test>[a-z]+)',views.CreateQuestion.as_view(), name = 'learning'),
    url(r'^conv/(?P<type>[a-z]+)/(?P<test>[a-z]+)',views.CreateQuestion.as_view(), name = 'learn'),
    url(r'^own/(?P<type>[a-z]+)/(?P<test>[a-z]+)',views.CreateQuestion.as_view(),name="own"),
    url(r'^math/(?P<type>[a-z]+)/(?P<test>[a-z]+)',views.CreateQuestion.as_view()),
    url(r'^grap/(?P<type>[a-z]+)/(?P<test>[a-z]+)',views.CreateQuestion.as_view()),
    url(r'^own-(?P<type>[a-z]+)',views.OwnChoice.as_view()),
    url(r'save_time',views.save_time),
#     url(r'^(?P<main>[a-z]+)/(?P<type>([a-z]|-)+)/(?P<test>[a-z]+)',views.CreateNonFrTo.as_view()),
    url(r'', include('social_auth.urls')),
)    