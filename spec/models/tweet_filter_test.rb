require_relative "../rails_helper"

RSpec.describe TweetFilter, :type => model do

  let(:tweets) { 9.times { FactoryGirl.build(:tweet) } }

  before :each do
    tweets << FactoryGirl.build(:tweet, screen_name: 'Most relevant', followers_count: 1001, retweet_count: 1001, favorite_count: 1001)
    tweets << FactoryGirl.build(:tweet, screen_name: 'Most mentions', followers_count: rand(0..100), retweet_count: rand(0..100), favorite_count: rand(0..100))
    tweets << FactoryGirl.build(:tweet, screen_name: 'Most mentions', followers_count: rand(0..100), retweet_count: rand(0..100), favorite_count: rand(0..100))
  end

  context 'with 10 tweets' do
    it 'order by most_relevants' do
      tweetFilter = TweetFilter.new(tweets)
      most_relevants = tweetFilter.most_relevants
      expect(most_relevants.first['screen_name']).to eq('Most relevant')
    end

    it 'order by most_mentions' do
      tweetFilter = TweetFilter.new(tweets)
      most_mentions = tweetFilter.most_mentions
      expect(most_mentions.first['screen_name']).to eq('Most mentions')
    end
  end


end
