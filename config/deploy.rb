set :application, "gomint"
load 'deploy/assets'

set :repo_url, "git@github.com:amisha0403/gomint_net.git"

set :branch, 'main'

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads", "vendor/bundle"

append :linked_files, "config/database.yml", "config/secrets.yml"

set :nginx_server_name, "localhost #{fetch(:application)}.local stg.shiftmanager.visunware.com"

set :rvm_type, :user

set :rvm_ruby_version, '2.6.5'
