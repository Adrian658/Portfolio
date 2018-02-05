class PagesController < ApplicationController
  def home
  	@homePage = Blog.all
  	@skills = Skill.all
  end

  def about
  end

  def contact
  end
end
