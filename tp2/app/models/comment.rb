class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post

	def formatted_message(shout = nil)
		if shout
			self.user.name + ' said: ' + self.message.upcase
		else
			self.user.name + ' said: ' + self.message
		end
	end
end
