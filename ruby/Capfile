# Load DSL and set up stages
require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/puma'
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
