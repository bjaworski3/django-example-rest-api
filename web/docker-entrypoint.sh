#!/bin/bash
python manage.py makemigrations api
python manage.py migrate
python manage.py collectstatic --no-input
exec "$@"