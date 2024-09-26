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
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app

WORKDIR /app

ARG DEV=false
RUN python3 -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true"]; \
        then /py/bin/pip install -r requirements.dev.txt ; \
    fi && \
    rm -rf /tmp

RUN adduser --disabled-password --no-create-home django-user

ENV PATH="/py/bin:$PATH"

EXPOSE 8000

USER django-user