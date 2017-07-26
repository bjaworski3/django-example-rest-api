#!/bin/bash
host=postgres

until psql -h "$host" -U "postgres" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
python manage.py makemigrations api
python manage.py migrate
python manage.py collectstatic --no-input
exec "$@"