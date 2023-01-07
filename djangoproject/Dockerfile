FROM python:3.8.2
ENV PYTHONUNBUFFERED=1

#this is the directory where the project will be stored
# WORKDIR /code

#copy requirements.txt to the container
COPY requirements.txt /app/

#it will install all the libraries inside requirements.txt
RUN pip install -r /app/requirements.txt

COPY . /app
WORKDIR /app
#this will tell the django that we are going to use this port
EXPOSE 8000

#this will tell the docker, to run this command to run our application
CMD ["python", "manage.py", "runserver"]