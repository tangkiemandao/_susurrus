# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "susurrus"
set :repo_url, "git@github.com:trungle1612/_susurrus.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/susurrus"

set :rbenv_type, :system
set :rbenv_ruby, '2.4.1'
set :rbenv_path, '/home/ubuntu/.rbenv'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :linked_files, %w{config/imgur.yml config/application.yml}

namespace :deploy do    
  desc 'Symlinks Secret.yml to the release path'
  task :update_cron do
    on roles(:app) do
      execute :bundle, :exec, "whenever --update-crontab #{fetch(:application)}"
   end
  end

  after  :finishing,    :update_cron
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end

namespace :logs do
  desc 'Tail application logs'
  task :tail_app do
    on roles(:app) do
   		execute "tail -f #{shared_path}/log/#{fetch(:stage)}.log"
 		end
	end
end
