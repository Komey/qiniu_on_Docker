

from ubuntu

maintainer Komey <lmh5257@live.cn>

run apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git python python-dev python-setuptools nginx sqlite3 supervisor
RUN easy_install pip
RUN pip install uwsgi



add . /home/docker/code/


run echo "daemon off;" >> /etc/nginx/nginx.conf

run rm /etc/nginx/sites-enabled/default
run ln -s /home/docker/code/nginx-app.conf /etc/nginx/sites-enabled/
run ln -s /home/docker/code/supervisor-app.conf /etc/supervisor/conf.d/

# run pip install
run pip install -r /home/docker/code/app/requirements.txt

VOLUME ["/home/docker/code/app"]
expose 80
cmd ["/home/docker/code/run.sh"]
