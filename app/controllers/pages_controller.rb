class PagesController < ApplicationController
  def home
  	@homePage = Blog.all
  end

  def about
  end

  def contact
  end
end
