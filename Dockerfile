FROM ruby:3.3

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs

# Set working directory
WORKDIR /app

# Copy Gemfile first
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy rest of the app
COPY . .

# Add entrypoint script
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Default command
CMD ["rails", "server", "-b", "0.0.0.0"]
