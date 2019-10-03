# ruby-centos7
DockerHub: https://cloud.docker.com/u/esfahan/repository/docker/esfahan/centos7-ruby

## build

```
$ sudo docker build -t ruby-centos7 ./
```

## run

```
$ sudo docker run --rm --name ruby-centos7 -it ruby-centos7:latest /bin/bash
```

## rails new

```
$ bundle init
$ bundle config --local build.nokogiri --use-system-libraries
$ bundle install --path vendor/bundle
$ bundle exec rails new -d mysql .
$ mkdir tmp/sockets
$ mkdir tmp/pids
```

puma

```
$ bundle exec puma -t 5:5 -p 3000 -e development -C config/puma.rb
```

## docker-compose
docker-compose.yml

```Dockerfile
version: '3.1'

services:
  web:
    container_name: rails-test-web
    hostname: rails-test-web
    image: esfahan/centos7-ruby:ruby2.5.1-bundler1.15.0
    volumes:
      - ./code:/code
    ports:
      - "3000:3000"
    tty: true
  db:
    container_name: rails-test-db
    hostname: rails-test-db
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_USER: rails
      MYSQL_DATABASE: rails_db
      TZ: "Asia/Tokyo"
      BIND-ADDRESS: 0.0.0.0
    env_file:
      - .env
    ports:
      - 3306:3306
    volumes:
      - ./db/mysql_init:/docker-entrypoint-initdb.d
      - ./db/mysql_data:/var/lib/mysql
    tty: true
```

.env

```ini
MYSQL_ROOT_PASSWORD=
MYSQL_PASSWORD=
```
