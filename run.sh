#!/bin/bash

if [ -f /.root_pw_set ]; then
	echo "Root password already set!"
	exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"
touch /.root_pw_set

echo "========================================================================"
echo "你现在可以登录这个容器咯~:"
echo ""
echo " ssh -p <port> root@<host>"
echo " root 密码 '$PASS'"
echo ""
echo "记得尽快修改密码~"
echo "========================================================================"



MODULE=${MODULE:-website}
echo "finding django project (module: ${MODULE})"
sed -i "s#module=website.wsgi:application#module=${MODULE}.wsgi:application#g" /home/docker/code/uwsgi.ini

if [ ! -f "/home/docker/code/app/manage.py" ]
then
	echo "creating basic django project (module: ${MODULE})"
	django-admin.py startproject ${MODULE} /home/docker/code/app/
fi

/usr/bin/supervisord
