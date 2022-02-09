#!/bin/bash

for s in $(mysql --defaults-file=/root/my.cnf -AN -e "show tables from otus");
do
mysqldump --defaults-file=/root/my.cnf --no-create-info --source-data=2 otus $s > $s.sql;
done
