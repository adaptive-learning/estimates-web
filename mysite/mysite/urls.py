from django.conf.urls import patterns, include, url
from django.views.generic import TemplateView
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
#      Examples:

     url(r'^$', 'learning.views.index', name='home'),
     url(r'', include('social_auth.urls')),
     url(r'^about',TemplateView.as_view(template_name="about.html")),
     url(r'^i18n/', include('django.conf.urls.i18n')),
     url(r'^learning/', include('learning.urls')) ,
     url(r'^admin/', include(admin.site.urls)),
     url(r'^users/',include('users.urls')),
)
