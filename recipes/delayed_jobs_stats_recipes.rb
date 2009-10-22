namespace :delayed_job do
  desc "View aggregate statistics about delayed jobs"
  task :stats, :roles => :app do
    run "cd #{current_path} && rake RAILS_ENV=#{rails_env} jobs:stats"
  end
end
