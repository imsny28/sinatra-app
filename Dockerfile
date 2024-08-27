FROM ruby:3.2.2

RUN apt-get update -qq && \
    apt-get install -y git

ENV APP_PATH=/app

WORKDIR $APP_PATH

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids
RUN mkdir log

COPY Gemfile Gemfile.lock ./

RUN bundle install

# Copy the main application.
COPY . ./

EXPOSE 8080

# Configure the main process to run when running the image
CMD ["bundle", "exec", "puma", "-C", "puma.rb"]