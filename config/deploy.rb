require 'bundler/capistrano'
puts 'rvm >>>>>>'
set :rvm_ruby_string, 'ruby-1.8.7-p370@college'

set :application, "college"
set :use_sudo, false

set :scm, :git
set :repository,  "https://github.com/mangocoder/college.git"
set :scm_passphrase, "madyrocks"

set :user, "root"

role :web, "180.149.241.115"                          # Your HTTP server, Apache/etc
role :app, "180.149.241.115"                          # This may be the same as your `Web` server
role :db,  "180.149.241.115", :primary => true # This is where Rails migrations will run

set :deploy_to, "/var/www/college"
set :keep_releases, 3 
set :server, :passenger


after "deploy:update_code", "init:create_db"

after "deploy:restart", "bundler:install_gems"


namespace :init do
   task :create_db, :roles => :app, :except => { :no_release => true } do
	#run "cd #{current_path}; rake RAILS_ENV=#{rails_env} db:create"
   end
end

namespace :utils do
  desc "Restart Apache2 Service"
  task :restartA2, :role => :app do
    run  "cd /etc/init.d/httpd restart"
  end
end

namespace :bundler do
  desc "Run: bundle install"
  task :install_gems, :role => :app do
     run "#{current_release} bundle install"
  end

  desc "Run: bundle update"
  task :update_gems, :role => :app do
     run "#{current_release} bundle update"
  end

  desc "Install Bundler"
  task :install_bundler, :role => :app do
    run "gem install bundler"
  end
end


namespace :deploy do
  task :start, :roles => :app do
    run "chown -R apache:apache #{current_release}/public"
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  desc "Migrate DB"
  task :migrate_db do
    run "cd #{current_path} && bundle exec rake db:migrate RAILS_ENV=production"
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :load_schema, :roles => :app do
    run "cd #{current_path}; RAILS_ENV=production rake db:schema:load"
  end
end

namespace :run_rake do
  desc "Run a task on a remote server: cap run_rake:invoke task="
  # run like: cap staging rake:invoke task=a_certain_task
  task :invoke, :roles => :app do
    run("cd #{deploy_to}/current; rake #{ENV['task']} RAILS_ENV=production")
  end
end

