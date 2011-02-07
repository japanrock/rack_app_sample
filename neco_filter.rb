# coding: utf-8
# sample from http://gihyo.jp/dev/serial/01/ruby/0025

class NecoFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    res = @app.call(env)
    res[2].each do |body|
      body.gsub!(/！|？|。|，/) { "にゃ#{$&}" }
    end

    res
  end
end
