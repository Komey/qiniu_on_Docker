#!/bin/bash

if [ -f /.root_passwd_set ]; then
	echo "Root password already set!"
	exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"
touch /.root_passwd_set

echo "========================================================================"
echo "You can now connect to this container via SSH using:"
echo ""
echo " ssh -p <port> root@<host>"
echo " and enter the root password '$PASS' "
echo ""
echo "remember to change the above password !"
echo "========================================================================"