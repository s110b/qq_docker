# Use a smaller base image
FROM ruby:3.1-alpine as builder

# Install necessary packages for building
RUN apk add --no-cache build-base git

WORKDIR /app

# Install Jekyll and other required gems
RUN gem update --system \
    && gem install jekyll bundler faraday-retry \
    && gem cleanup

# Clone the jekyll theme
RUN git clone https://github.com/s110b/feng.git .

# Install bundle
RUN bundle install \
    && rm -rf /usr/local/bundle/cache/*.gem

# Start a new stage for the final image
FROM ruby:3.1-alpine

# Install git in the final image
RUN apk add --no-cache git

WORKDIR /app

# Copy the app and its dependencies from the builder stage
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder /app/ /app/

# Make port 4000 available to the world outside this container
EXPOSE 4000
ENTRYPOINT [ "bundle", "exec", "jekyll", "s", "--host=0.0.0.0" ]
