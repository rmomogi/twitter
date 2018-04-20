class HomeController < ApplicationController

  def index

  end

  def most_relevants
    tweet_filter = TweetFilter.new(LocawebTweetApi::obtain_tweets())
    render :json => JSON.pretty_generate(tweet_filter.most_relevants.as_json)
  end

  def most_mentions
    tweet_filter = TweetFilter.new(LocawebTweetApi::obtain_tweets())
    render :json => JSON.pretty_generate(tweet_filter.most_mentions.as_json)
  end

end
