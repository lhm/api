$LOAD_PATH.unshift File.expand_path("../lib", File.dirname(__FILE__))

require 'api'
require 'rspec'
require 'json_spec'
require 'rack/test'


# set :environment, :test

describe 'Basic Spec' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context 'GET /' do

    subject { get '/'; last_response }

    its(:status) { should eq(400) }
    its(:body)   { should have_json_path("error") }
    its(:body)   { should be_json_eql(%("Wrong url format.")).at_path("error") }

  end

end
