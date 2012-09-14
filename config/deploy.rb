require 'bundler/capistrano'
set :application, "college"
set :use_sudo, false

set :scm, :git
set :repository,  "https://github.com/mangocoder/college.git"
set :scm_passphrase, "madyrocks"

set :user, "webwerks"

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run

#role :db,  "your slave db-server here"

set :deploy_to, "/var/www/college"
set :keep_releases, 3 
set :server, :passenger
#after "deploy", "deploy:production"

after "deploy:update_code", "init:create_db"
after  "init:create_db", "deploy:migrate" 

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

 #If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
   task :production do
    # set :bundle_without, [:development, :test]
    # set :rails_env, 'production'
   end	  
 end


  namespace :init do
    task :create_db, :roles => :app, :except => { :no_release => true } do
	#run "cd #{current_path}; rake RAILS_ENV=#{rails_env} db:create"
    end
  end
