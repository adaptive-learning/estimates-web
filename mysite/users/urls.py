from django.conf.urls import *

from users import views
from users.views import *

urlpatterns = patterns("",
    url(r'^register', CreateUser.as_view()),
    url(r'^login/$', 'django.contrib.auth.views.login'),
    url(r'^logout/$', 'django.contrib.auth.views.logout',{'template_name': 'registration/logout.html'})
)    