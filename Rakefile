# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "honeybadger-local-context"
  gem.homepage = "http://github.com/tronathan/honeybadger-local-context"
  gem.license = "MIT"
  gem.summary = %Q{Adds local method context to Honeybadger}
  gem.description = %Q{Adds the local method context to Honeybadger notifications}
  gem.email = "jonathan.yankovich@gmail.com"
  gem.authors = ["Jonathan Yankovich"]
  # dependencies defined in Gemfile
  gem.add_dependency 'honeybadger'
  gem.add_dependency 'binding_of_caller'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : "0.1"

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "honeybadger-local-context #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
