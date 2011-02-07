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
