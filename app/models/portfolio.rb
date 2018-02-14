class Portfolio < ApplicationRecord

	validates_presence_of :title, :body, :main_image, :thumb_image

	#Custom scopes that are called by the controller
	def self.java
		where(subtitle: 'Java')
	end

end
