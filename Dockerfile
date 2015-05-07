

from ubuntu

maintainer Komey <lmh5257@live.cn>

run apt-get update
RUN (echo "deb http://archive.ubuntu.com/ubuntu/ precise main restricted universe multiverse" > /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-updates main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ precise-security main restricted universe multiverse" >> /etc/apt/sources.list)

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git python python-dev python-setuptools nginx sqlite3 supervisor

RUN easy_install pip
RUN pip install uwsgi



ADD . /home/docker/code/


RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /home/docker/code/nginx-app.conf /etc/nginx/sites-enabled/
RUN ln -s /home/docker/code/supervisor-app.conf /etc/supervisor/conf.d/

RUN pip install -r /home/docker/code/app/requirements.txt

VOLUME ["/home/docker/code/app"]
EXPOSE 80
CMD ["/home/docker/code/run.sh"]
