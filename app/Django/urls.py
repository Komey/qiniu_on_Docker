from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    # Examples:
    # url(r'^$', 'Django.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^komey/', include(admin.site.urls)),
    url(r'^faceweb/',include('faceweb.urls')),

]
