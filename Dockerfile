FROM rails:5

WORKDIR /app
COPY . .

RUN gem install bundler && bundle install && rails db:migrate RAILS_ENV=production

EXPOSE 3000