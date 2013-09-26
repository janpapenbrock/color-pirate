require "spec_helper"

describe Color do
	
	describe "#new" do
		it "should raise an ArgumentError for having less than three parameters" do
			lambda { Color.new(1, 2) }.should raise_exception ArgumentError
		end

		it "should accept three arguments" do
			Color.new(1, 2, 3).should be_instance_of Color
		end
	end
	
end