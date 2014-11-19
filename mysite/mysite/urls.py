from django.conf.urls import patterns, include, url
#from mysite.home import views

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    #url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^polls/',include('polls.urls')),
    url(r'^$', include('learning.urls')) ,
    url(r'^admin/', include(admin.site.urls)),
    url(r'^math/',include('learning.urls')),
    url(r'^f/',include('foundation.urls')),
)
