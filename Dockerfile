FROM ruby:latest
LABEL authors="grego"

WORKDIR /tests
# This is the dockerfile to build the container for ruby tests.
RUN gem install rspec capybara selenium-webdriver

ENTRYPOINT ["rspec"]