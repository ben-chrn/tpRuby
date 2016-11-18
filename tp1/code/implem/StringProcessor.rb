class StringProcessor
	def self.count(str, letter = nil)
		if letter.class == NilClass
			return str.size
		else
			return str.downcase.scan(letter.downcase).count
		end
	end

	def self.concat(str1, str2)
		[str1, str2].join(' ')
	end
end