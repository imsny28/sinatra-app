threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count
shared_dir = "./tmp"

preload_app!

rackup      "config.ru"
port        ENV['PORT']     || 8080
rack_env = ENV['RACK_ENV'] || "production"
environment rack_env

# Set up socket location
bind "unix://#{shared_dir}/sockets/puma.sock"

# Logging
stdout_redirect "./log/puma.stdout.log", "./log/puma.stderr.log", true

# Set master PID and state locions
pidfile "#{shared_dir}/pids/puma.pid"
state_path "#{shared_dir}/pids/puma.state"