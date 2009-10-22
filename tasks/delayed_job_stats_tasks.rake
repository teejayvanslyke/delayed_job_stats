namespace :jobs do

  desc "View aggregate statistics about delayed jobs"
  task :stats => :environment do
    
    def jobs_remaining
      Delayed::Job.count
    end

    def jobs_failed
      Delayed::Job.find(:all, :conditions => 'failed_at != 0').count
    end

    def jobs_run
      Delayed::Job.find(:all, :conditions => 'attempts > 0').count
    end

    def workers
      Delayed::Job.find_by_sql("SELECT DISTINCT locked_by FROM delayed_jobs WHERE locked_at != NULL").count
    end

    puts "Jobs remaining: #{jobs_remaining}"
    puts "Jobs run:       #{jobs_run}"
    puts "Jobs failed:    #{jobs_failed}"
    puts "Workers:        #{workers}"
  end
end
