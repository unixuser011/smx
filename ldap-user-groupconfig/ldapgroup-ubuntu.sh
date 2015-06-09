#!/bin/bash

read -p "Enter domain name > " domainName
read -p "Enter top level domain name > " tldName

SUFFIX='dc=$domainName,dc=$tldName'
LDIF='/root/ldapgroup.ldif'

for line in `grep "x:[1-9][0-9][0-9][0-9]:" /etc/group`
do
    CN="`echo $line | cut -d: -f1`"
    LGID="`echo $line | cut -d: -f3`"
    
    echo "dn: cn=$CN,ou=groups,$SUFFIX" >> $LDIF
    echo "objectClass: posixGroup" >> $LDIF
    echo "cn: $CN" >> $LDIF
    echo "gidNumber: $LGID" >> $LDIF
    echo "memberUid: `grep ":$LGID:" /etc/passwd | cut -d: -f1`" >> $LDIF

    users="`echo $line | cut -d: -f4`"
    if [ "$users" ]
    then
        for user in `echo "$users" | sed 's/,/ /g'`
        do
            [ ! "$CN" = "$user" ] && echo "memberUid: $user" >> $LDIF
        done
    fi
    echo >> $LDIF
done