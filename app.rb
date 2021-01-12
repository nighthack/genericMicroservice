require 'sinatra'
require 'mongoid'
require 'httparty'

# Include the models
require './models/user'
require './models/document'

# Include the routes
require './routes/users'

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))
