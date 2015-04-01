# from django.conf.urls import *
# 
# from users import views
# from users.views import *
# 
# urlpatterns = patterns("",
#     url(r'^register', CreateUser.as_view()),
#     url(r'^login/$', 'django.contrib.auth.views.login'),

# )    
from django.conf.urls import *
from django.contrib import admin
 
from .views import  *
 
 
admin.autodiscover()
 
urlpatterns = patterns('',
    # some other urls
 
    url(r'^admin/', include(admin.site.urls)),
    url(r'^complete/(?P<backend>[^/]+)/$', AuthComplete.as_view()),
    url(r'^login-error/$', LoginError.as_view()),
    url(r'^logout/$', 'django.contrib.auth.views.logout',{'template_name': 'registration/logout.html'}),
    url(r'', include('social_auth.urls')),
)