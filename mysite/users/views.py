# from django.shortcuts import render, render_to_response, HttpResponseRedirect
# from django.conf import settings
# from django.http import HttpResponse, HttpResponseBadRequest, HttpResponseRedirect
# from django.contrib.auth.forms import AuthenticationForm
# from django.contrib.auth import login as auth_login, logout as auth_logout
# from forms import UserCreateForm
# from django import forms
# from django.core.exceptions import ValidationError
# from django.views.generic.edit import CreateView, FormView, View
# from django.utils.decorators import method_decorator
# from django.views.decorators.debug import sensitive_post_parameters
# 
# class CreateUser(CreateView):
#     template_name = 'registration/register.html'
#     form_class=UserCreateForm
# #     def post(self,request):
# # #         try:
# #         reque = super(CreateUser,self).post(request)
# # #         except ValidationError :
# # #             raise Exception("")
# #         return HttpResponseRedirect('/learning',reque)
#     def form_valid(self,form):
#         ret = super(CreateView,self).form_valid(form)
#         return HttpResponseRedirect('/users/login',ret)
#         
# class UserInfo(View):
#     pass
# 
# 
# class LoginUser(FormView):
#     form_class = AuthenticationForm
#     template_name = 'users/login.html'
#     def form_valid(self, form):
#         redirect_to = settings.LOGIN_REDIRECT_URL
#         auth_login(self.request, form.get_user())
#         if self.request.session.test_cookie_worked():
#             self.request.session.delete_test_cookie()
#         return HttpResponseRedirect(redirect_to)
# 
#     def form_invalid(self, form):
#         return self.render_to_response(self.get_context_data(form=form))
#     
#     @method_decorator(sensitive_post_parameters('password'))
#     def post(self,request):
#         request.session.set_test_cookie()
#         super(LoginUser,self).post(request)
#         return HttpResponseRedirect('/learning')
# 
# class LogoutUser(View):
#     def get(self, request, *args, **kwargs):
#         auth_logout(request)
#         return HttpResponseRedirect(settings.LOGOUT_REDIRECT_URL)
#     
    
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
    