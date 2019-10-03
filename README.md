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
