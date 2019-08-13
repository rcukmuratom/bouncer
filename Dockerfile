FROM ruby:2.6
WORKDIR /usr/local/bouncer
COPY . .
RUN bundle install
EXPOSE 9292
CMD ["puma"]
