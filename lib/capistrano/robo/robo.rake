desc <<-DESC
    Run Robo tasks. By default, it runs with no task specified, which \
    means the default Robo task will be run.

    You can override any of these defaults by setting the variables shown below.

      set :robo_exec, 'robo'
      set :robo_target_path, release_path
      set :robo_roles, :all
      set :robo_flags, '-v'
DESC
task :robo, :task_name do |t, args|
  fail ArgumentError.new('The robo task needs an argument, none passed.') unless args[:task_name]
  on roles fetch(:robo_roles) do
    within fetch(:robo_target_path, release_path) do
      options = [fetch(:robo_flags)]
      options << args[:task_name]

      execute fetch(:robo_exec), options
    end
  end
end

namespace :robo do
  task default: :robo
end

namespace :load do
  task :defaults do
    set :robo_exec, 'robo'
    set :robo_roles, :all
    set :robo_flags, '-v'
  end
end
