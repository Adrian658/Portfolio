class PagesController < ApplicationController
  def home
  	@blogs = Blog.all
  	@skills = Skil.all
  end

  def about
  end

  def contact
  end
end
