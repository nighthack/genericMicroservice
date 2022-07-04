require 'rack/contrib'
require './app'

use Rack::PostBodyContentTypeParser
run Sinatra::Application
