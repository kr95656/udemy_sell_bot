class ApplicationController < ActionController::Base
  require 'line/bot' #gem 'line-bot-api'を使用
  protect_from_forgery with: :null_session #callbackアクションのCSRFトークン認証を無効
  before_action :validate_signature

  def validate_signature
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end
  end

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
end