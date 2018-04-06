class PagesController < ApplicationController
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
    @tweets = SocialTool.twitter_search
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
end
