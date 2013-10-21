require 'spec_helper'

describe Show do 

	before { @show = Show.new(title: "Sample Show") }

	subject { @show }

	it { should respond_to(:title) }
	it { should respond_to(:titles) }

	it { should be_valid }

	describe "when title is not present" do
		before { @show.title = " " }

		it { should_not be_valid }
	end

	describe "new show" do 
		before { 
			@show.save 
			@show = Show.update_current_show("This New Show")
		}

		it { @show.title.should == "This New Show" }
		it { Show.current_show.title.should == "This New Show" }
	end

end
