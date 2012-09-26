require 'sinatra'
require 'twitter'

get '/' do
  @query = params['query']
  @tweets = []

  if @query && @query.length > 0
    client = Twitter::Client.new
    tweet_container = client.search(@query)
    if tweet_container
      @tweets = tweet_container.results
    end
  end

  erb :index
end
