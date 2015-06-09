#!/bin/bash

read -p "Enter domain name > " domainName
read -p "Enter top level domain name > " tldName

SUFFIX='dc=$domainName,dc=$tldName'
LDIF='/root/ldapuser.ldif'

echo -n > $LDIF
for line in `grep "x:[1-9][0-9][0-9][0-9]:" /etc/passwd | sed -e "s/ /%/g"`
do
    LUID="`echo $line | cut -d: -f1`"
    NAME="`echo $line | cut -d: -f5 | cut -d, -f1`"

    if [ ! "$NAME" ]
    then
        NAME="$LUID"
    else
        NAME=`echo "$NAME" | sed -e 's/%/ /g'`
    fi

    SN=`echo "$NAME" | awk '{print $2}'`
    [ ! "$SN" ] && SN="$NAME"

    SHADOWFLAG=`grep $LUID: /etc/shadow | cut -d: -f9`
    [ ! "$SHADOWFLAG" ] && SHADOWFLAG="0"

    echo "dn: uid=$LUID,ou=people,$SUFFIX" >> $LDIF
    echo "objectClass: inetOrgPerson" >> $LDIF
    echo "objectClass: posixAccount" >> $LDIF
    echo "objectClass: shadowAccount" >> $LDIF
    echo "sn: $SN" >> $LDIF
    echo "givenName: `echo $NAME | awk '{print $1}'`" >> $LDIF
    echo "cn: $NAME" >> $LDIF
    echo "displayName: $NAME" >> $LDIF
    echo "uidNumber: `echo $line | cut -d: -f3`" >> $LDIF
    echo "gidNumber: `echo $line | cut -d: -f4`" >> $LDIF
    echo "userPassword: {crypt}`grep $LUID: /etc/shadow | cut -d: -f2`" >> $LDIF
    echo "gecos: $NAME" >> $LDIF
    echo "loginShell: `echo $line | cut -d: -f7`" >> $LDIF
    echo "homeDirectory: `echo $line | cut -d: -f6`" >> $LDIF
    echo "shadowExpire: `passwd -S $LUID | awk '{print $7}'`" >> $LDIF
    echo "shadowFlag: $SHADOWFLAG" >> $LDIF
    echo "shadowWarning: `passwd -S $LUID | awk '{print $6}'`" >> $LDIF
    echo "shadowMin: `passwd -S $LUID | awk '{print $4}'`" >> $LDIF
    echo "shadowMax: `passwd -S $LUID | awk '{print $5}'`" >> $LDIF
    echo "shadowLastChange: `grep $LUID: /etc/shadow | cut -d: -f3`" >> $LDIF
    echo >> $LDIF
done