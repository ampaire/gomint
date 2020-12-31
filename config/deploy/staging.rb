server '51.79.65.125', user: 'ubuntu', roles: %w{app db web}

set :deploy_to, "/home/ubuntu/gomint/#{fetch(:rails_env)}"

set :branch, :master

set :stage, :staging

# set :ssh_options, {

    # keys: %w(~/.ssh/shift-manager.pem),

    # auth_methods: %w(publickey)

# }




