# capistrano-db-migrate

Database migrations support for Capistrano v3.

It works very similar to capistrano-rails migrations but it's rails-agnostic. I personally use it with my Padrino apps.

## Installation

    gem 'capistrano-db-migrate', github: 'marshall-lee/capistrano-db-migrate'

## Usage

    # Capfile
    require 'capistrano/bundler'
    require 'capistrano/db_migrate'

    # config/deploy.rb
    set :migration_env, rack_env: fetch(:rack_env)
    after 'deploy:updated', 'deploy:db:migrate'
