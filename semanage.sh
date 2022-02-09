#!/bin/bash

cm=$(sestatus | grep mode)
cf=$(sestatus | grep config)
echo
echo "SELINUX STATUS"
echo "$cm"
echo "$cf"
echo
echo "To activate 'enforcing' mode - press 1. For 'permissive' mode - press 0"
read numb
if [ $numb = 0 ]
then
setenforce 0
echo
sestatus | grep mode
else
setenforce 1
echo
sestatus | grep mode
fi

echo
echo "To activate 'enforcing' mode in config file - press 1. To deactivate - press 0"
read conf
if [ $conf = 0 ]
then
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
echo
sestatus | grep config
echo
echo "Restart system"
else
sed -i 's/SELINUX=disabled/SELINUX=enforcing/g' /etc/selinux/config
sestatus | grep config
echo
echo "Restart system"
fi
