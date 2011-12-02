load 'deploy' if respond_to?(:namespace) # cap2 differentiator

# Uncomment if you are using Rails' asset pipeline
# load 'deploy/assets'

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

# load 'config/deploy' # remove this line to skip loading any of the default tasks

role :libs, "www.breakthroughlivingclass.com"

task :search_libs do
	run "ls -xl /usr/lib |grep -i xml"
end

task :count_libs do
	run "ls -xl /usr/lib | wd -l"
end
