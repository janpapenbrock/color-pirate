class Buccaneer

	attr_reader :params

	DEFAULT_PARAMS = {
		bucket_size: 10
	}

	def initialize bucket_class, params={}
		@bucket_class = bucket_class
		@params = DEFAULT_PARAMS.merge(params)
	end

	def buckets
		return @buckets if @buckets

		@buckets = (1..params[:bucket_size]).collect do |n|
			@bucket_class.new(params)
		end
	end

	def sorted_buckets
		buckets.sort{|a, b| a.count <=> b.count}.reverse
	end

	def put_in_bucket object
		buckets.each do |bucket|
			if bucket.can_add? object
				bucket.add object
				return bucket
			end
		end
		nil		
	end

end