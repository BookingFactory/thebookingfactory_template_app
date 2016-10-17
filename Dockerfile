FROM ubuntu:14.04

RUN apt-get update && apt-get install -y git \
    curl \
    build-essential \
    zlib1g-dev \
    libssl-dev \
    libreadline-dev \
    libyaml-dev \
    postgresql \
    postgresql-contrib \
    postgresql-server-dev-9.3 && rm -rf /var/lib/apt/lists/* && apt-get autoremove

RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

RUN . /etc/profile.d/rbenv.sh && rbenv install 2.3.1 && rbenv rehash && rbenv global 2.3.1

ENV RBENV_ROOT /usr/local/rbenv
ENV PATH       "/usr/local/rbenv/bin:/usr/local/rbenv/shims:/usr/local/sbin:/rusr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
ENV RACK_ENV   production

WORKDIR /website_engine

ADD Gemfile /website_engine/Gemfile
ADD Gemfile.lock /website_engine/Gemfile.lock

RUN . /etc/profile.d/rbenv.sh && cd /website_engine && gem install bundle && bundle install

ADD . /website_engine

CMD thin start
