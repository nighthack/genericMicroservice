require 'sinatra'
require 'mongoid'
require 'httparty'
require './models/user'
require './models/order'
require './routes/users'

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))
