<h1>Party Parrot App</h1>

<img src='media/images/party-parrot.gif' alt='parrot' height="200" width="200">
<br>
<br>
<h3></h3>

Sample Python application on Django with PostgreSQL database.

<h3>Requirements</h3>

____


- django 4.0.1
- Pillow 9.0.0
- psycopg2-binary 2.9.3
- django-prometheus 2.2.0

<h3>Deployment</h3>

____



- install Python 3.8
- install libs 
```shell
      pip3 install -r requirements.txt
```

* Set environment export for variables:
```yaml
      DJANGO_DB_HOST: db
      DJANGO_DB_NAME: app
      DJANGO_DB_USER: worker
      DJANGO_DB_PASS: worker
      DJANGO_DB_PORT: "5432"
      DJANGO_DEBUG: "False"
```


* migrate database:
```shell
python3 manage.py migrate
```

* start application:
```shell
python3 manage.py runserver 0.0.0.0:8000
```

____

<h2>How to prepare and install docker image for this application.</h2>


Install docker and docker-compose as specified in the official documentation for your OS.

Clone this project to local storage:

```shell
git clone https://github.com/bigxxl/bigxxl-devops-sample-django-app
```

Create directories for database and media locations on host server.

Change to directory of your application and edit enviroment variables for DJANGO, PostgreSQL, volume mappings for DB, MEDIA directories and listen port number for application in <b>docker-compose.yml</b> if needed.

Copy media files from orginal package to host media directory:

```shell
cp -R ./media/* /opt/parrot-media/
```

You can also tune up configuration file <b>uwsgi.ini</b> for uWSGI web server.

Run this commands:

```shell
docker-compose build
```

<h3>How to run apllication in docker container.</h3>
Run:

```shell
docker-compose up
```

Use <b>"-d"</b> option to run app in detached mode:

```shell
docker-compose up -d
```

Try to connect with your web browser to your host with defined port number(8000 by default). 
For example http://1.2.3.4:8000.
