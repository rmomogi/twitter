Rails.application.routes.draw do
  root to: "home#index"

  get "most_relevants", to: "home#most_relevants"
  get "most_mentions", to: "home#most_mentions"

end
