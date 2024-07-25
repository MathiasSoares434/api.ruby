FROM ruby:3.3.4

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN gem install bundler

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

COPY . .

RUN bundle install

CMD ["ruby", "shoppetx.rb", "-o", "0.0.0.0", "-p", "4567"]