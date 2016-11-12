class SymbolProcessor
	def self.equal?(elem1, elem2)
		if elem1.class == Symbol
			elem1 = elem1.to_s
		end

		if elem2.class == Symbol
			elem2 = elem2.to_s
		end

		return elem1 == elem2

	end
end