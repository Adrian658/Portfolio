module SetSource
	extend ActiveSupport::Concern

	included do
		before_action :set_source
	end

	#variable to store the site a user came from
    def set_source
  	  session[:source] = params[:q] if params[:q]
    end
end