class CarSort
	def self.perform(cars)
		result = {}

		cars.each do |i|
			if !result[i.to_sym]
				result[i.to_sym] = 1
			end
		end

		cars.each_with_index do |color, index|
			if index != (cars.count - 1)
				if color == cars[index+1]
					result[color.to_sym]+=1
				end
			end
		end

		return result
	end
end