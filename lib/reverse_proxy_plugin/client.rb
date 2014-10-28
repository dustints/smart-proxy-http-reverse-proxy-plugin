require 'net/http'
require 'net/https'
require 'uri'
require 'proxy/request'
require 'addressable/uri'

module ReverseProxy
  class Client < ::Proxy::HttpRequest::ForemanRequest

    def uri
      @uri ||= Addressable::URI.parse(::ReverseProxy::Plugin.settings.url)
    end

    def self.instance
      @instance ||= Client.new
    end

    def rhsm_status
      request = request_factory.create_get("/rhsm", {})
      send_request(request)
    end
  end
end
