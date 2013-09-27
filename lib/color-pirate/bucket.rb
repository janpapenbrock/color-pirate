class Bucket

	attr_reader :params

	def initialize params={}
		@params = params
	end

	def objects
		@objects ||= []
	end

	def add object
		objects << object
		objects.uniq!
	end

end