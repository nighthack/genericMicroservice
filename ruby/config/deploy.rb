# config valid only for current version of Capistrano
lock '3.3.5'

set :scm, :git
set :application, 'generic'
set :repo_url, 'git@github.com:nighthack/genericMicroservice.git'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp')

set :bundle_without, (fetch(:bundle_without) << ' deployment')
set :puma_preload_app, true
set :puma_worker_timeout, nil

set :keep_releases, 3

namespace :deploy do
  before :finished, :restart_server do
    on roles(:app), in: :parallel do
      within release_path.join('tmp') do
        execute :touch, 'restart.txt'
      end
    end
  end
end
