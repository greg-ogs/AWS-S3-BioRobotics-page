FROM ruby:latest
LABEL authors="grego"
# This is the dockerfile to build the container for ruby tests.
RUN gem install rspec capybara selenium-webdriver

COPY ./tests /tests

ENTRYPOINT ["rspec"]