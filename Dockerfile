FROM alpine:3.9

RUN apk add --no-cache py3-pip python3 python2-dev python3-dev libffi-dev openssl-dev

# install mysql mariadb 
RUN apk add --no-cache mariadb-dev mariadb-client libxml2-dev libxslt-dev

# install post gres sql 
RUN apk add --no-cache postgresql-dev postgresql-client

# install gcc compiler
RUN apk add --no-cache gcc musl-dev


# copy the project
COPY ./djangoproject /app

# install requirements.txt file
RUN pip3 install -r /app/requirements.txt


# set the working directory
WORKDIR /app

RUN python3 manage.py makemigrations
RUN python3 manage.py migrate   
#expose the port
EXPOSE 8000

# run the server
CMD ["python3", "manage.py", "runserver", "0:8000"]

