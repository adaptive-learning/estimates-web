from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
#      Examples:

     url(r'^$', 'learning.views.index', name='home'),
     url(r'', include('social_auth.urls')),
     url(r'^learning/', include('learning.urls')) ,
     url(r'^admin/', include(admin.site.urls)),
     url(r'^users/',include('users.urls')),
)
