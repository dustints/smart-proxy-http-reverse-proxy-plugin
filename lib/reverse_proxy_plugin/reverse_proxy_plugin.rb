module ReverseProxy
  class Plugin < ::Proxy::Plugin
    plugin "reverse-proxy", ReverseProxy::VERSION
    default_settings :url => 'https://localhost:8443/'

    http_rackup_path File.expand_path("http_config.ru", File.expand_path("../", __FILE__))
    https_rackup_path File.expand_path("http_config.ru", File.expand_path("../", __FILE__))
  end
end
