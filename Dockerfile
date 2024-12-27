FROM ruby:3.3-alpine

RUN apk add --no-cache build-base

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD [ "bin/notify.rb" ]
