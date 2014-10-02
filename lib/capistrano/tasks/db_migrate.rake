namespace :deploy do
  namespace :db do
    desc 'Runs rake db:migrate'
    task :migrate do
      on primary fetch(:migration_role) do
        info '[deploy:migrate] Run `rake db:migrate`'
        within release_path do
          env = fetch(:migration_env)
          with env do
            execute :rake, "db:migrate"
          end
        end
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :migration_role, fetch(:migration_role, :db)
    set :migration_env, fetch(:migration_env, {})
  end
end
