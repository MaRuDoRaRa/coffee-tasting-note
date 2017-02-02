require "bundler/capistrano"

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
