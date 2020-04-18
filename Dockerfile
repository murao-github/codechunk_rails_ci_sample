# base image ruby 2.7.0
FROM ruby:2.7.0
ENV LANG C.UTF-8

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y \
    sudo \
    nodejs \
    build-essential \ 
    libpq-dev \
    nano

# copy project sources
ENV APP_HOME /codechunk
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

# install gems
RUN bundle install