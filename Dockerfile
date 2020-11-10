FROM ruby:2.7
WORKDIR /usr/local/bouncer
COPY . .
RUN bundle install
EXPOSE 9292
CMD ["puma"]
