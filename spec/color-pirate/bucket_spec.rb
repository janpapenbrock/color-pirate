require "spec_helper"

describe Bucket do
	
	before :each do
		@bucket = Bucket.new
		@object = double("object")
	end

	describe "#new" do
		it "should accept no arguments" do
			Bucket.new.should be_instance_of Bucket
		end

		it "should accept one argument" do
			Bucket.new({1 => 2}).should be_instance_of Bucket
		end
    end

    describe "#objects" do
    	it "should contain no objects first" do
    		@bucket.objects.count.should eql 0
    	end

    	it "should have a list of objects added to the bucket" do
    		@bucket.add(@object)
    		@bucket.objects.count.should eql 1
    	end
	end

	describe "#add" do
		it "should add an object to the list of objects" do
			count = @bucket.objects.count
			@bucket.add @object
			@bucket.objects.count.should eql count + 1
		end

		it "should add an object only once" do
			count = @bucket.objects.count
			@bucket.add @object
			@bucket.add @object
			@bucket.objects.count.should eql count + 1
		end
	end
end