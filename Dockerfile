FROM python:3.9-alpine3.13
LABEL maintainer="londonappdeveloper.com"

ENV PYTHONUNBUFFERED=1

RUN apk update && apk add --no-cache \
    python3-dev \
    build-base \
    libffi-dev \
    openssl-dev \
    musl-dev \
    postgresql-dev \
    linux-headers

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
EXPOSE 8000
WORKDIR /app

ARG DEV=false
RUN python3 -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-build-dev \
        build-base postgresql-dev musl-dev && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user



ENV PATH="/py/bin:$PATH"

USER django-user
