# config valid only for current version of Capistrano
lock '3.11.2'

set :application, 'kardies-admin'
set :repo_url, 'git@github.com:AlexAvlonitis/kardies-admin.git'

#RBENV#
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.6.3'

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
append :rbenv_map_bins, 'puma', 'pumactl'
set :rbenv_roles, :all # default value

set :nginx_use_ssl, true

set :user, 'deployer'
set :application, 'kardies-admin'
set :rails_env, 'production'
server 'vps193319.ovh.net', user: "#{fetch(:user)}", roles: %w{app db web}, primary: true
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :deploy_via, :remote_cache
set :pty, true

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/puma.rb')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :config_example_suffix, '.example'
set :config_files, %w{config/database.yml}
set :puma_conf, "#{shared_path}/config/puma.rb"

namespace :deploy do
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  after 'puma:smart_restart', 'nginx:restart'
end
