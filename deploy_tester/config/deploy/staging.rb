set :rails_env, "staging"
set :unicorn_rack_env, "staging"

role :app, %w{Yuta@160.16.207.151}
role :web, %w{Yuta@160.16.207.151}
role :db,  %w{Yuta@160.16.207.151}

server '160.16.207.151', user: 'Yuta', roles: %w{web app}

set :ssh_options, {
  keys: %w(~/.ssh/Sakura_vps_1),
  forward_agent: false,
  auth_methods: %w(publickey)
}