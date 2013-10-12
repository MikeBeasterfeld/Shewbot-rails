require 'spec_helper'

describe IrcUser do 

	before do
		@ircuser = IrcUser.new(name: 'jxpx802.11')
	end

	subject { @ircuser }

	it { should respond_to(:name) }

	it { should be_valid }

	describe "when username is blank" do 
		before { @ircuser.name = " " }

		it { should_not be_valid }
	end

	describe "when username is already taken" do 
		before do
			user_with_same_name = @ircuser.dup
			user_with_same_name.name = @ircuser.name.upcase
			user_with_same_name.save
		end

		it { should_not be_valid }
	end
end
