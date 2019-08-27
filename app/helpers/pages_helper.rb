module PagesHelper

  def twitter_parser tweet

    regex_links = %r{
      \b
      (
        (?: [a-z][\w-]+:
         (?: /{1,3} | [a-z0-9%] ) |
          www\d{0,3}[.] |
          [a-z0-9.\-]+[.][a-z]{2,4}/
        )
        (?:
         [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
        )+
        (?:
          \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
          [^\s`!()\[\]{};:'".,<>?«»“”‘’]
        )
      )
    }ix

    regex_date = /\d{4}-[01]\d-[0-3]\dT[0-2]\d:[0-5]\d:[0-5]\d(?:\.\d+)?Z?/

    #if type == "time"
    tweet_with_date_distance = tweet.gsub(regex_date) do |date|
      distance_of_time(date)
    end.html_safe
    #else
    #  tweet_with_links = tweet.gsub(regex_links) do |url|
    #    "<a href='#{url}' target='_blank'>#{url}</a>"
    #  end.html_safe
    #end

  end

  def sort_skills skills
    skills.sort_by{ |skill| -skill.percent_utilized  }
  end

  def distance_of_time from_time
    seconds = (Time.now.utc - from_time.to_datetime).to_i
    #Time.new(portfolio_item.created_at.year, portfolio_item.created_at.month, portfolio_item.created_at.day, portfolio_item.created_at.hour, portfolio_item.created_at.min, portfolio_item.created_at.sec, "+00:00")).to_i;
    minutes = (seconds / 60).to_i;
    hours = (minutes / 60).to_i; 
    days = (hours / 24).to_i;
    months = (days / 30).to_i;
    years = (months / 12).to_i;
    return_string = "Posted "
    if years > 0
      temp = return_string + years.to_s + " year"
      if years > 1
        temp = temp + "s"
      end
      if months > 0
        temp = temp + " and " + (months - years*12).to_s + " months ago"
      else
        temp = temp + " ago"
      end
      temp
    elsif months > 0
      return_string + months.to_s + " months ago"
    elsif days > 0
      return_string + days.to_s + " days ago"
    elsif hours > 0
      if hours > 1
        return_string + hours.to_s + " hours ago"
      else
        return_string + hours.to_s + " hour ago"
      end
    elsif minutes > 0
      return_string + minutes.to_s + " minutes ago" 
    else
      return_string+ seconds.to_s + " seconds ago"
    end
  end

end
