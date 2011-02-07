# coding: utf-8
# SampleCode from http://gihyo.jp/dev/serial/01/ruby/0023

class SimpleApp
  def call(env)
    p env
    case env['REQUEST_METHOD']
    when 'GET'
      [
        200,
        { 'Content-Type' => 'text/html' },
        ['<html><body><form method="POST"><input type="submit" value="見たい？" /></form></html>']
      ]
    when 'POST'
      [
        200,
        { 'Content-Type' => 'text/html'},
        ['<html><body>何見てんだよ</body></html>']
      ]
    end
  end
end

# SampleCode from http://gihyo.jp/dev/serial/01/ruby/0024
# Usage:
#   ruby simple_app_no_config_ver2.rb
if __FILE__ == $0
  require 'rubygems'
  require 'rack'
  require 'rack/lobster'
  urlmap = Rack::URLMap.new( '/simple' => SimpleApp.new, '/lobster' => Rack::Lobster.new )
  Rack::Handler::WEBrick.run urlmap, :Port => 9292
end
