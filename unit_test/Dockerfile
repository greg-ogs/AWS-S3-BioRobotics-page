FROM ruby:latest
LABEL authors="grego"

RUN gem install rspec capybara selenium-webdriver

COPY . /tests

ENTRYPOINT ["rspec"]