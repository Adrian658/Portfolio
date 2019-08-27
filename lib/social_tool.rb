module SocialTool

  def self.twitter_search search_param

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
      config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
    end

    client.search(search_param, result_type: 'recent', lang: 'en').take(6).collect do |tweet|
      "<div class='tweet-header'>
      <img src=#{tweet.user.profile_banner_url} height='40px' width='40px'>
      <strong class='pl-2'>#{tweet.user.screen_name}</strong>
      </div>
      <div class='tweet-body pt-2'>#{tweet.text}</div>
      <div class='twitter-footer pt-2'>#{tweet.created_at.to_s.gsub(/\s+/, "T").gsub("TUTC", "")}</div>".html_safe
    end
  end

end
