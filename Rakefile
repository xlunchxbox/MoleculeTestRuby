require 'rspec/core/rake_task'

task :run_driver do
	load 'src/mtm.rb'
end

task :run do
  load 'src/driver.rb'
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :default => :run_driver
