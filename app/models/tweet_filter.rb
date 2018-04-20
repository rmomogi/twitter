class TweetFilter

  attr_accessor :tweets

  def initialize(tweets)
    @tweets = tweets
  end

  def most_relevants
    @tweets.sort_by {|item| [item.followers_count, item.retweet_count, item.favorite_count]}.reverse
  end

  def most_mentions
    @tweets.group_by {|m| m.screen_name}.sort_by {|item| item[1].count}.reverse
  end

end
