#!/bin/bash

MODULE=${MODULE:-website}

sed -i "s#module=website.wsgi:application#module=${MODULE}.wsgi:application#g" /home/docker/code/uwsgi.ini

if [ ! -f "/home/docker/code/app/manage.py" ]
then
	echo "creating basic django project (module: ${MODULE})"
	django-admin.py startproject ${MODULE} /home/docker/code/app/
fi

/usr/bin/supervisord
