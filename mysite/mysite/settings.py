"""
Django settings for mysite project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import dj_database_url
import os
from django.utils.translation import ugettext_lazy as _

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
STATIC_ROOT = os.path.join(BASE_DIR, '../../static')
STATIC_URL = '/static/'



# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '79413j8ek-6t-qt8_1--e*yasmxu2lvlbtzvcd8j_*wt&nuwmr'

# SECURITY WARNING: don't run with debug turned on in production!
ON_SERVER = os.getenv('ON_AL', "False") == "True"
DEBUG = os.getenv('DJANGO_DEBUG', "False") == "True"
if not ON_SERVER:
    DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = ['*']

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

DATABASES = {"default": dj_database_url.config(default='mysql://admin:estimate@localhost/estimation_db')}

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'sk-sk'
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
LOGIN_REDIRECT_URL = '/learning'

AUTHENTICATION_BACKENDS = (
    'social_auth.backends.facebook.FacebookBackend',
    'social_auth.backends.google.GoogleOAuth2Backend',
    'django.contrib.auth.backends.ModelBackend',
    'lazysignup.backends.LazySignupBackend',
)

SOCIAL_AUTH_PIPELINE = (
    'social_auth.backends.pipeline.social.social_auth_user',
    'social_auth.backends.pipeline.user.get_username',
    'social_auth.backends.pipeline.user.create_user',
    'social_auth.backends.pipeline.social.associate_user',
    'social_auth.backends.pipeline.social.load_extra_data',
    'social_auth.backends.pipeline.user.update_user_details'
)
EMAIL_HOST = 'localhost'

EMAIL_PORT = 25
EMAIL_USE_TLS = True

SESSION_SERIALIZER= 'django.contrib.sessions.serializers.PickleSerializer'
GOOGLE_OAUTH2_CLIENT_ID = os.getenv("GOOGLE_OAUTH2_CLIENT_ID", "824945897278-rcivje8rjh86b19ofoe39s7cq6nbnso8.apps.googleusercontent.com")
GOOGLE_OAUTH2_CLIENT_SECRET = os.getenv("GOOGLE_OAUTH2_CLIENT_SECRET", "rWqWGWm0XA8_EgQoHmOhCJlS")
FACEBOOK_APP_ID = os.getenv('FACEBOOK_APP_ID', "1428279880801074")
FACEBOOK_API_SECRET = os.getenv('FACEBOOK_API_SECRET', "471a8f17a2dfe5ea0699855085bf5503")
LOGIN_URL = '/'

SOCIAL_AUTH_ENABLED_BACKENDS = ('google','facebook')

SOCIAL_AUTH_UID_LENGTH = 128
SOCIAL_AUTH_NONCE_SERVER_URL_LENGTH = 128
SOCIAL_AUTH_ASSOCIATION_SERVER_URL_LENGTH = 128
SOCIAL_AUTH_ASSOCIATION_HANDLE_LENGTH = 128
