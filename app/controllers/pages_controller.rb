class PagesController < ApplicationController
  before_action :set_session_pages

  def home
  	@blogs = Blog.all
    @skills = Skill.all
  end

  def about
    @skills = Skill.all
  end

  def contact
  end

  def tech_news
    begin
      search_term = ("#" + params[:twitter_search]).gsub(/\s+/, "")
      session[:twitter_search_term] = search_term
    rescue
      search_term = "#neymar"
      session[:twitter_search_term] = search_term
    end
    @tweets = SocialTool.twitter_search(search_term)
  end

  def download_resume
    send_file(
      "#{Rails.root}/app/assets/documents/Resume.pdf",
      filename: "Resume.pdf",
      type: "application/pdf"
    )
  end

  def download_transcript
    send_file(
      "#{Rails.root}/app/assets/documents/Transcript_Official.pdf",
      filename: "Transcript_Official.pdf",
      type: "application/pdf"
    )
  end

  private

  def set_session_pages
    if session.has_key?(:first_visit_pages)
      ###
    else
      session[:first_visit_pages] = 1
    end
  end

end
