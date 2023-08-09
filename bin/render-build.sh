#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean

# Drop the existing
bundle exec rake db:drop

# Create a new database
bundle exec rake db:create

# Migrate the new database
bundle exec rake db:migrate