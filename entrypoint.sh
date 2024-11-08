#!/bin/bash
#export DJANGO_DB_HOST=db
#export DJANGO_DB_NAME=app
#export DJANGO_DB_USER=worker
#export DJANGO_DB_PASS=worker
#export DJANGO_DB_PORT="5432"
#export DJANGO_DEBUG="False"
python3 manage.py migrate
uwsgi --master --ini /home/app/uwsgi.ini
