—————————————————————————————————————————————

跑在在之前的Django容器下的七牛业务服务器的一个小容器

—————————————————————————————————————————————

实现功能：

upload Token 生成->调用URL:/uploadtoken?bucket=XXXX&key=XXXXX
必选变量：bucket

列举Bucket文件列表->调用URL:/listbucket?bicket=XXXXX
必选变量：bucket

—————————————————————————————————————————————

镜像使用方法

docker pull index.alauda.cn/lmh5257/django-on-docker

docker run -p 80 -d -e AK=XXX -e SK=XXX index.alauda.cn/lmh5257/django-on-docker

建议在灵雀云中直接部署服务

在环境变量中手动输入AK和SK

—————————————————————————————————————————————

必选环境变量：

AK = qiniu AccessKey
SK = qiniu SecretKey

AK和SK请登录七牛Portal自行查看，务必填写~~~

—————————————————————————————————————————————

