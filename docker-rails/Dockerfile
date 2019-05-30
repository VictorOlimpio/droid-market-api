FROM ruby:2.6.1

RUN apt-get update -qq && apt-get install -y \
      mysql-client
RUN gem install bundler
WORKDIR /usr/src/app/droid-market
COPY Gemfile Gemfile.lock ./
RUN bundle install --without test
COPY . .
RUN chmod u+x docker-rails/make-db.sh
