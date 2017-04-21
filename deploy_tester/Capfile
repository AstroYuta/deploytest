# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

require 'capistrano/rbenv'

set :rbenv_type, :user
set :rbenv_ruby, '2.4.1'

require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'

require 'capistrano3/unicorn'

# Rails4から分離したsecrets.ymlの環境変数を .envファイルで管理する
set :linked_files, %w{config/secrets.yml .env}

# タスクを読み込むけど、今回は特に使わない
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }



