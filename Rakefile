require 'coveralls/rake/task'
require "bundler/gem_tasks"
require 'cucumber/rake/task'
require 'cane/rake_task'
require 'tailor/rake_task' unless ENV['CI'] ## will crash due to version dependency of Tailor

Coveralls::RakeTask.new

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = ['features', '-x', '--format progress']
end

desc "Run all test suites"
task :test => [:features]

desc "Run cane to check quality metrics"
Cane::RakeTask.new do |cane|
  cane.canefile = './.cane'
end

Tailor::RakeTask.new unless ENV['CI']

desc "Display LOC stats"
task :stats do
  puts "\n## Production Code Stats"
  sh "countloc -r lib"
  puts "\n## Test Code Stats"
  sh "countloc -r features"
end

desc "Run all quality tasks"
if ENV['CI']
  task :quality => [:cane, :stats]
else
  task :quality => [:cane, :tailor, :stats]
end

task :default => [:test, :quality, 'coveralls:push']
