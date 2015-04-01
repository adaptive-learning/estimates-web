from django.core.urlresolvers import reverse
from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.views.generic.base import View
# from social_auth.backends.exceptions import AuthFailed
from social_auth.views import complete
from django.contrib.auth import logout 

from django.template import RequestContext
from django.shortcuts import render_to_response, redirect
from django.contrib.messages.api import get_messages
 
 
 

class AuthComplete(View):
    def get(self, request, *args, **kwargs):
        logout(request) 
        backend = kwargs.pop('backend')
#         try:
        return complete(request, backend, *args, **kwargs)
 
class LoginError(View):
    def get(self, request, *args, **kwargs):
        return HttpResponse(status=401) 


class LogoutUser(View):
    def get(self, request, *args, **kwargs):
        logout(request)
        return HttpResponseRedirect(settings.LOGOUT_REDIRECT_URL)
    