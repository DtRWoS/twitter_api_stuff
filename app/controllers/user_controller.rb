class UserController < ApplicationController
=begin
Consumer Key (API Key)	HIDYtyLfPnPjZEjSgJT4SdHw4
Consumer Secret (API Secret)	nFwwfQPYhDqvd9ErZDYPN4il9Zu1JWqqqoG8lmUbwQW4xvitww
=end

  def index
    get_tweets '@trueX'
  end

  def byid
  end

protected
  def get_tweets
    token
    #https://api.twitter.com/1.1/statuses/user_timeline.json
  end


  def token(options = {})
    key    = 'HIDYtyLfPnPjZEjSgJT4SdHw4'
    secret = 'nFwwfQPYhDqvd9ErZDYPN4il9Zu1JWqqqoG8lmUbwQW4xvitww'
    token = 'Basic ' + Base64.encode64(key + ':' + secret)
    options[:authorization] = token
    options[:Content-Type]  = 'application/x-www-form-urlencoded;charset=UTF-8'
    options[:accept]        = '*/*'
    body[:grant_type]  ||= 'client_credentials'
    url = 'https://api.twitter.com/oauth2/token'
    headers = Twitter::Headers.new(self, :post, url, options).request_headers
      response = HTTP.with(options).post(url, form: body)
      response.parse['access_token']
    end

end
