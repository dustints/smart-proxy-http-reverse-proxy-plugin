require 'test_helper'
require 'webmock/test_unit'
require 'mocha/test_unit'
require "rack/test"

require 'reverse_proxy_plugin/reverse_proxy_plugin'
require 'reverse_proxy_plugin/api'

class ReverseProxyApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    ReverseProxy::Api.new
  end

  def test_returns_pulp_status_on_200
    stub_request(:get, "#{::ReverseProxy::Plugin.settings.url.to_s}/rhsm").to_return(:body => "{\"api_version\":\"2\"}")
    get '/status'

    puts last_response
    assert last_response.ok?, "Last response was not ok: #{last_response.body}"
    assert_equal("{\"api_version\":\"2\"}", last_response.body)
  end

  def test_returns_50X_on_connection_refused
    Net::HTTP.any_instance.expects(:request).raises(Errno::ECONNREFUSED)
    get '/status'
    assert last_response.server_error?
  ensure
    Net::HTTP.any_instance.unstub(:request)
  end

  def test_returns_50X_on_socket_error
    Net::HTTP.any_instance.expects(:request).raises(SocketError)
    get '/status'
    assert last_response.server_error?
  ensure
    Net::HTTP.any_instance.unstub(:request)
  end
end
