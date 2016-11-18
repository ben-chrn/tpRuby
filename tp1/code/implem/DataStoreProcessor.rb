class Hash
	def method_missing(method)
		if self.key?(method)
			return self[method]
		else
			return 'INVALID'
		end
	end
end

class DataStore
	attr_accessor :models, :store, :memory

	def method_missing(method)
		if @store.key?(method)
			return @store[method]
		end
	end

	def initialize
		@models = Array.new
		@store = Hash.new
		@store[:items] = Array.new
		@store[:last_error] = nil
	end

	def register_model(name:name, attributes:attributes)
		if !@models.include?(name)
			@models.push(name)		
		end
	end

	def save(model:model, attributes:attributes)
		if model == "user"
			if attributes[:first_name] && attributes[:last_name]
				@store[:items].push({
					model: model,
					attributes: attributes
				})
			else
				attributes.each do |attribute|
					@store[:last_error] = "Invalid attribute: "+attribute[0].to_s
				end
			end
		elsif model == "article"
			if attributes[:title] && attributes[:body]
				@store[:items].push({
					model: model,
					attributes: attributes
				})
			else
				attributes.each do |attribute|
					attributes.each do |attribute|
						@store[:last_error] = "Invalid attribute: "+attribute[0].to_s
					end
				end
			end
		end
	end

	def count(model)
		counter = 0
		@store[:items].each do |elem|
			if elem[:model] == model
				
				counter = counter+1
			end
		end
		return counter
	end

	def models
		return @models
	end

	def last(model)
		@store[:items].each do |elem|
			if elem[:model] == model
				memory = {model: model}
				elem[:attributes].each {|key, value| memory[key] = value }
				@memory = memory
			end
		end
		return @memory
	end
end