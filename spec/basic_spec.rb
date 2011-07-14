$LOAD_PATH.unshift File.expand_path("../lib", File.dirname(__FILE__))

require 'api'
require 'rspec'
require 'rack/test'

# set :environment, :test

describe 'Basic Spec' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'responds with error on GET to "/"' do
    get '/'
    last_response.status.should eq(400)
    last_response.body.should match(/Wrong url format/)
  end
end
