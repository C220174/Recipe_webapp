# Recipe_webapp

docker-compose up  ---> to run server

docker-compose run --rm app sh -c "django-admin startproject app ."
docker-compose build
docker build .
docker-compose run --rm app sh -c "flake8"
docker-compose up
docker-compose down

docker-compose run --rm app sh -c "python manage.py startapp core"


docker-compose run --rm app sh -c "python manage.py test"

docker-compose run --rm app sh -c "python manage.py test && flake8"

docker-compose run --rm app sh -c "python manage.py makemigrations"

docker-compose run --rm app sh -c "python manage.py migrate"

docker volume ls
docker volume rm recipe_webapp_dev-db-data -> and docker down to refresh db

docker-compose run --rm app sh -c "python manage.py createsuperuser"