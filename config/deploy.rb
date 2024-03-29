require 'rvm/capistrano'
require 'bundler/capistrano'

default_run_options[:pty] = true  # Must be set for the password prompt
                                  # from git to work

set :rvm_type, :system 
set :rails_env, 'development'

set :user, 'lamguy'
set :domain, 'lamguy.com'
set :use_sudo, false 

set :application, "weathericos"
set :deploy_to, "/var/www/vhosts/lamguy.com/subdomains/weathericos.lamguy.com/rails/"
set :deploy_via, :remote_cache

set :scm, 'git'
set :repository,  "git@github.com:madebylam/weathericos.git"
set :ssh_options, { :forward_agent => true }
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end