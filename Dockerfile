FROM rails:5


WORKDIR /app
COPY . .

RUN gem install bundler && bundle install
RUN secret='rake secret RAILS_ENV=production' && export SECRET_KEY_BASE=`${secret}` && echo `SECRET_KEY_BASE=${secret}` >> .env


EXPOSE 3000