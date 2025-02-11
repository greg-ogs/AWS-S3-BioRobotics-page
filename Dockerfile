FROM ruby:latest
LABEL authors="grego"

RUN gem install rspec capybara selenium-web-driver

COPY unit_test /tests

ENTRYPOINT ["rspec"]