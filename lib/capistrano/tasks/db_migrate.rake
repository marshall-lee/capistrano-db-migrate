namespace :deploy do
  namespace :db do
    desc 'Runs rake db:migrate'
    task :migrate do
      on primary fetch(:migration_role) do
        info '[deploy:db:migrate] Run `rake db:migrate`'
        within release_path do
          env = fetch(:migration_env)
          with env do
            execute :rake, "db:migrate"
          end
        end
      end
    end

    desc 'Runs rake db:reset'
    task :reset do
      on primary fetch(:migration_role) do
        info '[deploy:db:reset] Run `rake db:reset`'
        within release_path do
          env = fetch(:migration_env)
          with env do
            execute :rake, "db:reset"
          end
        end
      end
    end
  end

  namespace :sq do
    desc 'Runs rake sq:create'
    task :create do
      on primary fetch(:migration_role) do
        info '[deploy:sq:create] Run `rake sq:create`'
        within release_path do
          env = fetch(:migration_env)
          with env do
            execute :rake, "sq:create"
          end
        end
      end
    end

    desc 'Runs rake sq:drop'
    task :drop do
      on primary fetch(:migration_role) do
        info '[deploy:sq:drop] Run `rake sq:drop`'
        within release_path do
          env = fetch(:migration_env)
          with env do
            execute :rake, "sq:drop"
          end
        end
      end
    end
  end if defined?(Sequel)
end

namespace :load do
  task :defaults do
    set :migration_role, fetch(:migration_role, :db)
    set :migration_env, fetch(:migration_env, {})
  end
end
