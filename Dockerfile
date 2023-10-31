# Use a smaller base image
FROM jekyll/jekyll

 

 
COPY feng-master   /blog
RUN chmod -R 777 /blog


WORKDIR /blog

RUN gem update --system \
    && gem install jekyll bundler faraday-retry \
    && gem cleanup

RUN bundle install \
    && rm -rf /usr/local/bundle/cache/*.gem
 
EXPOSE 4000
 