class Portfolio < ApplicationRecord

	has_many :technologies
	accepts_nested_attributes_for :technologies, 
									reject_if: lambda { |attrs| attrs['name'].blank? }

	include Placeholder

	validates_presence_of :title, :body, :main_image, :thumb_image

	#Custom scopes that are called by the controller
	def self.java
		where(subtitle: 'Java')
	end

	after_initialize :set_defaults

	#Set defaults for certain attributes of a model
	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
		self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
	end

end
