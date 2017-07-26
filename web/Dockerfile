FROM python:3-onbuild

RUN apt-get update \
    && apt-get install -y postgresql-client-9.4 \
    && rm -rf /var/lib/apt/lists/*
