@app_path = '/var/www/deploy_tester'
working_directory @app_path + "/current"

worker_processes 2
preload_app true
timeout 30
listen "/tmp/unicorn.sock", :backlog => 64
pid "/var/www/deploy_tester/shared/tmp/pids/unicorn.pid"

stderr_path "#{@app_path}/log/unicorn.stderr.log"
stdout_path "#{@app_path}/log/unicorn.stdout.log"

root = "/var/www/deploy_tester" 
before_exec do |server| 
ENV['BUNDLE_GEMFILE'] = "#{root}/Gemfile" 
end 

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end