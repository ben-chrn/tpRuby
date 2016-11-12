class Animal
	attr_accessor :name, :sound, :predators

	def initialize(name = nil)
		if(name != nil)
			@name = name[:name]
		end
		self.setSound
	end

	def setSound
		@sound = "Sound not defined"
	end

	def speak
		@sound
	end

	def predator?(animal)
		result = false;

		if @predators != nil
			@predators.each do |predator|
				if predator == animal.class
					result = true
				end
			end
		end

		return result
	end

	def enter_rage!
		@predators_rage = @predators
		@predators = nil
	end

	def exit_rage!
		@predators = @predators_rage
		@predators_rage = nil
	end
end

class Dog < Animal
	def setSound
		@sound = "woof"
	end
end

class Cat < Animal
	def setSound
		@sound = "meow"
	end
end

class Mouse < Animal
end