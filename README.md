Django的一个运行容器
使用Nginx和uWSGI作为运行环境

概念部分就不过多的赘述了，亲们自行度娘即可

——————————————————————————————————————————————————————————————

Dockerfile使用方法：

首先请将此Dockerfile clone到本地
git clone https://github.com/Komey/Django-on-Docker.git

构建本地镜像
sudo docker build -t komeydjango .

运行容器
sudo docker run -d komeydjango

——————————————————————————————————————————————————————————————

使用现有代码构建镜像

Ptyhon应用的代码文件，请存放在/app文件夹下，并确保wsgi.py文件在此文件夹下

/app文件夹下默认带有requirements.txt，该文件记录了你的Python应用所须运行库，在构建时会通过PIP安装文件中的依赖


