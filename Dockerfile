# Use a smaller base image
FROM jekyll/jekyll

 

 
COPY feng-master   /blog

WORKDIR /blog

RUN gem update --system \
    && gem install jekyll bundler faraday-retry \
    && gem cleanup

RUN bundle install \
    && rm -rf /usr/local/bundle/cache/*.gem
 
EXPOSE 4000
ENTRYPOINT [ "bundle", "exec", "jekyll", "s", "--host=0.0.0.0" ]
