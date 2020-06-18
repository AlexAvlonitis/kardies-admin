FROM ruby:2.7

RUN apt-get update -qq && apt-get upgrade -y \
  && apt-get install -y build-essential imagemagick mariadb-client apt-transport-https \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash \
  && apt-get update && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/* \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update && apt-get install -y yarn && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json ./
RUN npm install

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
RUN bundle exec rails assets:precompile
