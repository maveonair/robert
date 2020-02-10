FROM ruby:2.7-alpine

RUN apk add --no-cache ffmpeg sox

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install

ADD ./robert.rb .

ENTRYPOINT [ "ruby", "robert.rb" ]
