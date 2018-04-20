require 'faker'

FactoryGirl.define do
  factory :tweet do
    followers_count: { rand(0..999)  }
    screen_name: { Faker::Twitter.screen_name  }
    profile_link: { "https://twitter.com/#{Faker::Twitter.screen_name}" }
    created_at: { Date.today }
    link: { "https://twitter.com/#{Faker::Twitter.screen_name}/1" }
    retweet_count: { rand(0..999) }
    text: { 'Test twitter Locaweb' }
    favorite_count: { rand(0..999)  }
  end
end
