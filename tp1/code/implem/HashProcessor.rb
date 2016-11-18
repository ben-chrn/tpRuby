class HashProcessor

		attr_accessor :h

		def initialize(hash)
			@h = hash
			@last_deleted_element = nil
		end

		def size
			@h.size
		end

		def merge(hash)
			@h.merge(hash)
		end

		def find(sym)
			if @h[sym]
				return @h[sym]
			else
				return 'Unknown key, sorry'
			end
		end

		def delete(sym)
			@last_deleted_element = @h[sym]
			@h[sym] = nil
		end

		def restore(sym)
			@h[sym] = @last_deleted_element
			@last_deleted_element = nil
		end
end