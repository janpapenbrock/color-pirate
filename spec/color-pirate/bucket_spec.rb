require "spec_helper"

describe Bucket do
	
	describe "#new" do
		it "should accept no arguments" do
			lambda { Bucket.new }.should be_instance_of Bucket
		end

		it "should accept one argument" do
			Bucket.new({1 => 2}).should be_instance_of Bucket
		end
    end

	
end