# add /lib to loadpath
$LOAD_PATH.unshift File.expand_path("../lib", File.dirname(__FILE__))

require 'api'
require 'test/unit'
require 'assert_json'
require 'rack/test'
require 'turn'
require 'shoulda-context'

ENV['RACK_ENV'] = 'test'

class BaseTest < Test::Unit::TestCase
  include Rack::Test::Methods
  include AssertJson

  def app
    Sinatra::Application
  end

  def assert_status(code, response=last_response)
    assert response.status == code
  end

  def assert_body(json_string=last_response.body, &block)
    assert_json(json_string, &block)
  end

  context "GET '/'" do
    setup { get '/' }

    should "return an error" do
      assert_status 400
      assert_body { |json| json.element "error", "Wrong url format." }
    end
  end

end