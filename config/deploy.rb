require 'bundler/capistrano'
set :application, "college"

set :use_sudo, false

set :scm, :git
set :repository,  "https://github.com/mangocoder/college.git"
set :scm_passphrase, "madyrocks"

set :user, "root"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "180.149.241.115"                          # Your HTTP server, Apache/etc
role :app, "180.149.241.115"                          # This may be the same as your `Web` server
role :db,  "180.149.241.115", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :deploy_to, "/var/www/college"
set :keep_releases, 3 

#after "deploy", "deploy:migrate"
after "deploy", "deploy:cleanup"


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
   after "deploy:update_code", :link_production_db
  end

# database.yml task
   desc "Link in the production database.yml"
   task :link_production_db do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
   end

  namespace :init do
   task :check_db_existance do
   end
  end
