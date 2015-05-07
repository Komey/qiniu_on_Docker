 # -*- coding: utf-8 -*-
from django.db import models
from django.contrib import admin


# Create your models here.

class weixin_config(models.Model):
    app_id = models.CharField(max_length = 50,primary_key = True)
    app_secret = models.CharField(max_length = 50)
    token = models.CharField(max_length = 50)
    #aes_key = models.CharField(max_length = 50)

class weixin_configAdmin(admin.ModelAdmin):
    list_display = ('app_id','token')

admin.site.register(weixin_config,weixin_configAdmin)

class ak_ttl(models.Model):
    app_id = models.CharField(max_length = 50,primary_key = True)   ###微信APP_ID
    access_token = models.CharField(max_length = 512)  ###获取到的凭证
    expires_in = models.CharField(max_length = 50)  ###凭证有效时间，单位：秒
    get_time = models.DateTimeField(null= True)

class ak_ttlAdmin(admin.ModelAdmin):
    list_display = ('app_id','access_token','get_time')

admin.site.register(ak_ttl,ak_ttlAdmin)



