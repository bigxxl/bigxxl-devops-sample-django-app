# Based on standart debian image 
FROM python:3.12
ENV TZ=Europe/Moscow
# Default values. You can redefine it in docker-compose.yml
ENV DJANGO_DB_HOST="127.0.0.1"
ENV DJANGO_DB_NAME="app"
ENV DJANGO_DB_USER="worker"
ENV DJANGO_DB_PASS="worker"
ENV DJANGO_DB_PORT="5432"
ENV DJANGO_DEBUG="False"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies 

RUN apt-get update && apt-get install -y \ 
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/app
COPY requirements.txt .
RUN  pip3 install --upgrade pip && pip3 install --no-cache-dir -r requirements.txt && pip3 install uwsgi

# Copy app 
COPY . .

# Commands to run parrot app
RUN chmod +x /home/app/entrypoint.sh
ENTRYPOINT ["/home/app/entrypoint.sh"]


