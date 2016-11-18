class User < ApplicationRecord
	validates :name, :email, presence:true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true

	has_many :post

	def self.export(format: format)
		if format == :json
			return User.select(User.column_names - ["created_at", "updated_at"]).to_json
		else
			raise ArgumentError
		end
	end

	def commented_posts
		comments = Comment.where(User.ids == self.id)
		result = Array.new
		comments.each do |comment|
			post = Post.where(comment.post_id == Post.ids)
			if !result.include?(post)
				result.push(post)
			end
		end
		return result[0]
	end
end
