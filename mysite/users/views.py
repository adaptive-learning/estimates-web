from django.core.urlresolvers import reverse
from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.views.generic.base import View
from social_auth.views import complete
from django.contrib.auth import logout 
from django.template import RequestContext
from django.shortcuts import render_to_response, redirect
from django.contrib.messages.api import get_messages
 
  

class AuthComplete(View):
    def get(self, request, *args, **kwargs):

        print "ok?"
        backend = kwargs.pop('backend')
        logout(request) 
        return redirect("/users/login/%s"%backend)
 
class LoginError(View):
    def get(self, request, *args, **kwargs):
        return HttpResponse(status=401) 



class LogoutUser(View):
    def get(self, request, *args, **kwargs):
        print "logging out"
        logout(request)
        return HttpResponseRedirect(settings.LOGOUT_REDIRECT_URL)
    