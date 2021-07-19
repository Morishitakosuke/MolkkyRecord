FROM ruby:2.6.7
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir /MolkkyRecord
WORKDIR /MolkkyRecord
COPY Gemfile /MolkkyRecord/Gemfile
COPY Gemfile.lock /MolkkyRecord/Gemfile.lock
RUN bundle install
RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids
COPY . /MolkkyRecord
