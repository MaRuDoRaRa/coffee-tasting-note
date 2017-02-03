require "bundler/capistrano"
require "capistrano-rbenv"
set :rbenv_ruby_version, "2.4.0"

set :application, "coffee-tasting-note"
set :rails_env, "production"

server "coffee.tasting-note.site", :web, :app, :db, primary: true
set :repository, "git@github.com:MaRuDoRaRa/coffee-tasting-note.git"
set :scm, :git
set :branch, "master"
set :user, "coffee"
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{rails_env}"
set :deploy_via, :remote_cache
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/aws-my-key.pem) }

before "deploy:assets:precompile", roles: :app do
  run "/bin/cp #{shared_path}/config/database.yml #{release_path}/config/"
  run "/bin/cp #{shared_path}/config/unicorn.rb #{release_path}/config"
end

require "capistrano-unicorn"
