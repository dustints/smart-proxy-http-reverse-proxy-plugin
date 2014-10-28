require 'sinatra'
require 'reverse_proxy_plugin/client'

module ReverseProxy
  class Api < Sinatra::Base
    helpers ::Proxy::Helpers

    get "/status" do
      content_type :json
      begin
        result = ReverseProxy::Client.instance.rhsm_status
        return result.body if result.is_a?(Net::HTTPSuccess)
        log_halt result.code, "Katello rhsm at #{::ReverseProxy::Plugin.settings.url} returned an error: '#{result.message}'"
      rescue Errno::ECONNREFUSED => e
        log_halt 503, "Katello rhsm at #{::ReverseProxy::Plugin.settings.url} is not responding"
      rescue SocketError => e
        log_halt 503, "Katello rhsm '#{URI.parse(::ReverseProxy::Plugin.settings.url.to_s).host}' is unknown"
      end
    end
  end
end
