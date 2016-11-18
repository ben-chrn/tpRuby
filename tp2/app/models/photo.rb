class Photo < ApplicationRecord
	validates_format_of :url, :with => /(?:([^:\/?#]+):)?(?:\/\/([^\/?#]*))?([^?#]*\.(?:jpg|gif|png))(?:\?([^#]*))?(?:#(.*))?/

	belongs_to :post

	attr_accessor :file_format

	def file
		self.valid? ? self.url.match(/(\w+)\.(jpg|png|gif)$/)[0] : nil
	end

	def file_format
		self.valid? ? self.url.match(/(\w+)\.(jpg|png|gif)$/)[2] : nil
	end

	def self.all_urls
		urls = Photo.select(:url).map(&:url)
	end
end
