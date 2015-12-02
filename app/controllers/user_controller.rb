class UserController < ApplicationController
require "http"
require "json"

  def index
    @tweets = get_tweets
    #@tweets.each  { |tweet| puts tweet['text']}
  end

  def byid
  end

protected
  def get_tweets(userid: '@trueX')
    activeToken ||= token
    url = 'https://api.twitter.com/1.1/statuses/user_timeline.json'
    params = {}
    params['screen_name'] = userid
    params['count'] = 20
    result = HTTP.auth('Bearer ' + activeToken).headers(accept: '*/*').get(url, params: params)
    response = JSON.parse(result.body)
  end

  def token(options = {}, body = {})
    key    = 'HIDYtyLfPnPjZEjSgJT4SdHw4'
    secret = 'nFwwfQPYhDqvd9ErZDYPN4il9Zu1JWqqqoG8lmUbwQW4xvitww'
    token = 'Basic ' + Base64.strict_encode64(key + ':' + secret)
    options[:accept]        = '*/*'
    body[:grant_type]       = 'client_credentials'
    url = 'https://api.twitter.com/oauth2/token'
    response = JSON.parse(HTTP.auth(token).headers(options).post(url, form: body).body)
    response['access_token']
  end
end
