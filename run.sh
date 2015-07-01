#!/bin/bash

echo "Hi~~~"



AK=${AK}
SK=${SK}
echo "Get your keys (AK: ${AK} \n,SK:${SK})"
sed -i "s#AK='<Here is qiniu AccessKey>'#AK='${AK}'#g" /home/docker/code/app/hello/views.py
sed -i "s#SK='<Here is qiniu SecretKey>'#SK='${SK}'#g" /home/docker/code/app/hello/views.py


/usr/bin/supervisord
exec /usr/sbin/sshd -D