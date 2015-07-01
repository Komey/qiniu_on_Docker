# -*- coding:utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
from django.http import HttpResponse
import qiniu,json


AK='<Here is qiniu AccessKey>'
SK='<Here is qiniu SecretKey>'
# Create your views here.
def index(request):
    return HttpResponse('Hello from Python!')

def uploadToken(request):
    if AK=='' or SK=='':
        return HttpResponse('Empty AK or SK！')
    else:
        q = qiniu.Auth(AK,SK)
        bucket = request.GET.get('bucket','')
        key = request.GET.get('key','')
        if bucket=='':
            return HttpResponse("Empty bucket name!")
        else:
            if key =='':
                uptoken = q.upload_token(bucket)
                return HttpResponse(uptoken)
            else:
                uptoken = q.upload_token(bucket,key)
                return HttpResponse(uptoken)

def listBucket(request):
    bucket_name = request.GET.get('bucket','')
    if AK=='' or SK=='':
        return HttpResponse('Empty AK or SK！')
    else:
        if bucket_name == '':
            return HttpResponse('Empty bucket name!')
        else:
            q = qiniu.Auth(AK, SK)
            bucket = qiniu.BucketManager(q)
            ret, eof, info = bucket.list(bucket_name)
            print type(ret)
            data = json.dumps(ret,ensure_ascii=False)
            return HttpResponse(data)





