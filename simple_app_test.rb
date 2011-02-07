# config: utf-8
# Sample from http://gihyo.jp/dev/serial/01/ruby/0024?page=2

require 'rubygems'
require 'simple_app'
require 'test/unit'
require 'rack/mock'

class SimpleAppTest < Test::Unit::TestCase
  def setup
    @app = SimpleApp.new
    @mr  = Rack::MockRequest.new(@app)
  end

  def test_get
    res = nil
    assert_nothing_raised('なんか失敗した') { res = @mr.get('/', :lint => true) }
    assert_not_nil res, 'レスポンス来てない'
    assert_equal 200, res.status, 'ステータスコードが変'
    assert_equal 'text/html;charset=utf-8', res['Content-Type'], 'Content-Typeが変'
    assert_match /見たい？/, res.body, '本文が変'
  end

  def test_post
    res = nil
    assert_nothing_raised('なんか失敗した') { res = @mr.post('/', :lint => true)  }
    assert_not_nil res, 'レスポンスが来てない'
    assert_equal 200, res.status, 'ステータスコードが変'
    assert_equal 'text/html;charset=utf-8', res['Content-Type'], 'Content-Typeが変'
    assert_match /何見てんだよ。/, res.body, '本文が変'
  end
end
