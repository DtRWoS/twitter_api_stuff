class UserController < ApplicationController
require "http"
@activeToken

  def index
    puts get_tweets(userid: '@trueX')
  end

  def byid
  end

protected
  def get_tweets(userid: nil)
    activeToken ||= token
    activeToken.to_a
    #https://api.twitter.com/1.1/statuses/user_timeline.json
  end


  def token(options = {}, body = {})
    key    = 'HIDYtyLfPnPjZEjSgJT4SdHw4'
    secret = 'nFwwfQPYhDqvd9ErZDYPN4il9Zu1JWqqqoG8lmUbwQW4xvitww'
    token = 'Basic ' + Base64.strict_encode64(key + ':' + secret)
    #options[:authorization] = token
    #options[:Content-Type]  = 'application/x-www-form-urlencoded;charset=UTF-8'
    options[:accept]        = '*/*'
    body[:grant_type]       = 'client_credentials'
    url = 'https://api.twitter.com/oauth2/token'
    response = HTTP.auth(token).headers(options).post(url, form: body).to_a
    #response = HTTP.with(options).post(url, form: body)
    #response #.parse['access_token']
  end
end
