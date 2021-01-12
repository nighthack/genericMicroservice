set :user,            'ubuntu'
set :puma_threads,    [1, 16]
set :puma_workers,    2

server 'loyaltybot.nighthack.in', user: 'ubuntu', roles: %w{app}

set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/projects/#{fetch(:application)}"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :branch, :master

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
