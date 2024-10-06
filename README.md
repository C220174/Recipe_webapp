# Recipe_webapp

docker-compose up  ---> to run server

docker-compose run --rm app sh -c "django-admin startproject app ."
docker-compose build
docker build .
docker-compose run --rm app sh -c "flake8"
docker-compose up

docker-compose run --rm app sh -c "python manage.py startapp core"


docker-compose run --rm app sh -c "python manage.py test"