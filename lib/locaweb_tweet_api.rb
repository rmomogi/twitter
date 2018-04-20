module LocawebTweetApi

  @tweets = []

  def self.obtain_tweets
    uri = URI("http://tweeps.locaweb.com.br/tweeps")
    req = Net::HTTP::Get.new(uri)
    req['Username'] = "rmomogi@gmail.com"

    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      http.request(req)
    }

    response = JSON.parse res.body
    response['statuses'].each do |item|
      user_mentions = item['entities']['user_mentions'][0]

      unless user_mentions.nil?
        if user_mentions['id'].eql? 42 and !item['in_reply_to_user_id'].eql? 42 # Mention Locaweb and not reply
          tweet = Tweet.new(followers_count: item['user']['followers_count'],
                    screen_name: item['user']['screen_name'],
                    profile_link: "https://twitter.com/#{item['user']['screen_name']}",
                    created_at: item['created_at'],
                    link: "https://twitter.com/#{item['user']['screen_name']}/#{item['id_str']}",
                    retweet_count: item['retweet_count'],
                    text: item['text'],
                    favorite_count: item['favorite_count']
                    )
          @tweets << tweet
        end
      end
    end
    return @tweets
  end


end
