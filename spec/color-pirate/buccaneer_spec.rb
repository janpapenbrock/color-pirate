require "spec_helper"

describe Buccaneer do
	
	before :each do	
		@bucket_class = double("bucket")
		allow(@bucket_class).to receive(:new).and_return(
			double("bucket", count: 1, can_add?: true, add: nil),
			double("bucket", count: 3, can_add?: true, add: nil),
			double("bucket", count: 2, can_add?: true, add: nil),
			double("bucket", count: 4, can_add?: true, add: nil)
		)

		@object = double("color")

		@buccaneer = Buccaneer.new(@bucket_class)
	end

	describe "#new" do
		it "should raise an ArgumentError for less than one arguments" do
			lambda { Buccaneer.new }.should raise_exception ArgumentError
		end

		it "should accept a bucket class as first argument" do
			Buccaneer.new(@bucket_class).should be_instance_of Buccaneer
		end

		it "should accept two arguments" do
			Buccaneer.new(@bucket_class, {1 => 2}).should be_instance_of Buccaneer
		end
    end

    describe "#buckets" do
    	it "should return a list of buckets" do
    		@buccaneer.buckets.should be_instance_of Array
    	end
    end

    describe "#sorted_buckets" do
    	it "should return a sorted list of buckets" do
    		@buccaneer.sorted_buckets.should be_instance_of Array
    	end

    	it "should return buckets in descending order of counts" do
    		reverse_sorted_buckets = @buccaneer.sorted_buckets.reverse
    		previous_count = -1
    		reverse_sorted_buckets.each do |bucket|
    			bucket.count.should >= previous_count
    			previous_count = bucket.count
    		end
    	end
    end

    describe "#put_in_bucket" do
    	context "given a valid object" do
    		it "should put it in a bucket and return that bucket" do
    			@buccaneer.put_in_bucket(@object).should_not be_nil
    		end
    	end

    	context "given an invalid object" do
    		it "should not put it in a bucket" do
    			@buccaneer.buckets.each do |bucket|
    				allow(bucket).to receive(:can_add?).and_return false
    			end

    			@buccaneer.put_in_bucket(@object).should be_nil
    		end
    	end
    end

	
end