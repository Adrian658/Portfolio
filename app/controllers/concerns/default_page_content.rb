module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_action :set_title
	end


	def set_title
  		@page_title = "DevcampPortfolio"
  		@seo_keywords = "Adrian Guzman Portfolio"
  	end
end