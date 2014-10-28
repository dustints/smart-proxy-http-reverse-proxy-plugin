require 'reverse_proxy_plugin/api'

map "/reverseproxy" do
  run ReverseProxy::Api
end
