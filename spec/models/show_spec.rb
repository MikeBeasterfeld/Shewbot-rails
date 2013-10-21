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
			@newshow = Show.update_current_show("This New Show")
			@newshow.save
		}

		it { @newshow.title.should == "This New Show" }
		it { @newshow.id != @show.id }
		it { Show.current_show.title.should == "This New Show" }
	end

	describe "same show" do 
		before { 
			@show.save 
			@newshow = Show.update_current_show("Sample Show")
			@newshow.save
		}

		it { Show.current_show.title.should == "Sample Show" }
		it { Show.current_show.id.should == @show.id }
		it { @newshow.title.should == "Sample Show" }
		it { @newshow.id.should == @show.id }
	end

end
