#!/usr/bin/env bash
# exit on error
set -o errexit

# Install gems
bundle install

# Preinstall assets using esbuild
bundle exec rails assets:preinstall

# Clean up old assets (optional)
bundle exec rails assets:clean

# Migrate the database
bundle exec rails db:migrate

# Additional deployment steps if needed
# ...

# Start your Rails server or whatever is necessary for your deployment
# ...
