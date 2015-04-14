"""
Django settings for mysite project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
from django.utils.translation import ugettext_lazy as _
BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '79413j8ek-6t-qt8_1--e*yasmxu2lvlbtzvcd8j_*wt&nuwmr'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []

SESSION_SAVE_EVERY_REQUEST = True
# Application definition

INSTALLED_APPS = (
    'south',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'foundation',
    'compressor',
    'learning',
    'lazysignup', 
    'social_auth',
    'users',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

TEMPLATE_DIRS = [os.path.join(BASE_DIR, 'templates')]

ROOT_URLCONF = 'mysite.urls'

WSGI_APPLICATION = 'mysite.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {

         'ENGINE': 'django.db.backends.mysql',
         'NAME': 'estimation_db',
         'USER': 'admin',
         'PASSWORD': 'estimate',
         'HOST': '', 
         'PORT': '',
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'en-us'
LANGUAGES = (

  ('sk', ('Slovak')),

  ('cs', ('Czech')),
  ('en', ('English')),
)
LOCALE_PATHS = (
    'locale',
)

TIME_ZONE = 'Europe/Bratislava'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'compressor.finders.CompressorFinder',
)

COMPRESS_PRECOMPILERS = (
    ('text/coffeescript', 'coffee --compile --stdio'),
)

TEMPLATE_CONTEXT_PROCESSORS = (
   'django.core.context_processors.static',
    'django.core.context_processors.request',
   "django.contrib.auth.context_processors.auth",
   "django.core.context_processors.debug",
   "django.core.context_processors.i18n",
   "django.core.context_processors.media",
   "django.core.context_processors.static",
   "django.core.context_processors.tz",
   "django.contrib.messages.context_processors.messages",
   "social_auth.context_processors.social_auth_by_type_backends",
)

COMPRESS_ROOT = (
    'static'
)
## https://docs.djangoproject.com/en/1.6/howto/static-files/
STATIC_URL = '/static/'
LOGIN_REDIRECT_URL = '/learning'

AUTHENTICATION_BACKENDS = (
    'social_auth.backends.facebook.FacebookBackend',
    'social_auth.backends.google.GoogleOAuth2Backend',
#     'social_auth.backends.yahoo.YahooBackend',
    'django.contrib.auth.backends.ModelBackend',
    'lazysignup.backends.LazySignupBackend',
)

SOCIAL_AUTH_PIPELINE = (
    'social_auth.backends.pipeline.social.social_auth_user',
    #'social_auth.backends.pipeline.associate.associate_by_email',
    'social_auth.backends.pipeline.user.get_username',
    'social_auth.backends.pipeline.user.create_user',
    'social_auth.backends.pipeline.social.associate_user',
    'social_auth.backends.pipeline.social.load_extra_data',
    'social_auth.backends.pipeline.user.update_user_details'
)
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = os.environ.get("EMAIL_HOST_NAME", '')
EMAIL_HOST_PASSWORD = os.environ.get("EMAIL_HOST_PASS", '')
EMAIL_PORT = 587
EMAIL_USE_TLS = True

SESSION_SERIALIZER= 'django.contrib.sessions.serializers.PickleSerializer'
GOOGLE_OAUTH2_CLIENT_ID = "824945897278-rcivje8rjh86b19ofoe39s7cq6nbnso8.apps.googleusercontent.com"
GOOGLE_OAUTH2_CLIENT_SECRET = "rWqWGWm0XA8_EgQoHmOhCJlS"
FACEBOOK_API_SECRET = "471a8f17a2dfe5ea0699855085bf5503"
FACEBOOK_APP_ID = "1428279880801074"
LOGIN_URL = '/'

SOCIAL_AUTH_ENABLED_BACKENDS = ('google','facebook')
