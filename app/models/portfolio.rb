class Portfolio < ApplicationRecord

	has_many :technologies
	accepts_nested_attributes_for :technologies,
									reject_if: lambda { |attrs| attrs['name'].blank? }

	validates_presence_of :title, :body

	mount_uploader :thumb_image, PortfolioUploader
	mount_uploader :main_image, PortfolioUploader

	#Custom scopes that are called by the controller
	def self.java
		where(subtitle: 'Java')
	end

	def self.by_position
		order("position ASC")
	end

end
