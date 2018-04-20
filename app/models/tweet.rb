class Tweet
  attr_accessor :followers_count, :screen_name, :profile_link, :created_at, :link, :retweet_count, :text, :favorite_count

  def initialize(opts = {})
    opts.each do |key, value|
      self.public_send("#{key}=", value)
    end
  end

end
