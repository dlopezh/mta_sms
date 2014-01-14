require 'spec_helper'

describe Line do
	describe "line crud logic" do
		before do
			@line = Line.new
			@line.name = "L"
			@line.save
		end
		describe "displays line name" do
			@line.name.should == "L"
		end

	end
end