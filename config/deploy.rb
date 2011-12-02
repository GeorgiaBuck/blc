default_run_options[:pty] = true # Must be set for password prompt from git to work
set :name, "strong-river-5016"
set :user, "bucklandlo@bellsouth.net"
set :domain, "http://strong-river-5016.heroku.com/"
set :application, 'blc'
set :repository, "git@heroku.com:strong-river-5016.git"
set :deploy_to, "/home/#{user}/#{domain}"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "bucklandlo@bellsouth.net"
set :scm_passphrase, "rangerbob"
set :app_server, passenger
ssh_options[:forward_agent] = true

# role :web, "Apache"                          # Your HTTP server, Apache/etc
# role :app, "Apache"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"



# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
# miscellaneous option
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false

namespace :deploy do
	desc "cause Passenger to initiate a restart"
	task :restart do
		run "touch #{current_path}/tmp/restart.txt"
	end
end

after "deploy:update_code", bundle_install
desc "install the necessary prerequistes"
task :bundle_install, :roles => :app do
	run "cd #{release_path} && bundle install"
end
	
