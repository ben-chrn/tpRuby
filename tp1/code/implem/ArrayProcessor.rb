class ArrayProcessor
	attr_accessor :my_array, :my_array_sorted

	def initialize(array)
		@my_array = array
		@my_array_sorted = array.sort
	end

	def self.sort(array)
		array.sort
	end

	def contains?(letter)
		@my_array.include?(letter)
	end

	def self.double(array)
		array.map{|i| i + i}
	end
end