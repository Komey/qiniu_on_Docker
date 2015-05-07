# -*- coding: utf-8 -*-
from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def home(request):
    return HttpResponse("Hello World, Django")

def weixin(requst):
    return HttpResponse("微信！！！")

def det(requst):
    return HttpResponse("You're looking at my_args %s." % requst.GET['name'])
