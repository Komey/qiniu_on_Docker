# -*- coding: utf-8 -*-

from django.conf.urls import *
from faceweb.views import *

urlpatterns = [
    # Examples:
    # url(r'^$', 'Django.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^$',home),
    url(r'^weixin/',weixin),
    url(r'^det/',det ),
]

