class Post < ApplicationRecord
	belongs_to :user
	validates :user, presence:true
	after_initialize :init

	scope :published, -> { where(published: true)}

	def init
		if self.title
			self.title = self.title.capitalize
		end
	end

	def unpublish!
		self.published = false
	end

	def length
		self.message.length == 0 ? nil : self.message.length
	end

	def self.unpublish_all
		Post.update_all(published: false)
	end

	def photos
		photos = Photo.where(Post.ids == self.id)
	end
end
