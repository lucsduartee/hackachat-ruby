FROM ruby:3.0.0

WORKDIR /indicAI

RUN apt-get update -qq && apt-get upgrade -y && apt-get install -y postgresql-client

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

RUN chmod -R 777 ./

EXPOSE 4567

COPY . .

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]
