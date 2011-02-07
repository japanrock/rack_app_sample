# coding: utf-8
# SampleCode
#   http://gihyo.jp/dev/serial/01/ruby/0023
#   http://gihyo.jp/dev/serial/01/ruby/0024

require 'rubygems'
require 'rack/request'
require 'rack/response'

class SimpleApp
  def call(env)
    req = Rack::Request.new(env)

    body = case req.request_method 
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

    res = Rack::Response.new { |r|
      r.status = 200
      r.['Content-Type'] = 'text/html;charset=utf-8'
      r.write body
    }
    res.finish
  end
end
