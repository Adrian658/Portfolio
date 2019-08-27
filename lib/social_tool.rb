module SocialTool
  def self.twitter_search search_param
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
    end

    client.search(search_param, result_type: 'recent', lang: 'en').take(6).collect do |tweet|
      "<strong>#{tweet.user.screen_name}</strong> #{tweet.text} <div>#{tweet.created_at}</div>".html_safe
    end
  end
end
