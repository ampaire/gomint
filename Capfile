# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# require 'capistrano/rails/migrations'
require 'capistrano/bundler'
require "capistrano/rvm"
require 'capistrano/puma'

require 'capistrano/rails'
require 'capistrano/puma/nginx'
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Nginx




