require 'spec_helper'

describe Title do 

	before { @title = Title.new(title: "Sample Title", show_id: 1, irc_user_id: 1, votes_count: 0) }

	subject { @title }

	it { should respond_to(:title) }
	it { should respond_to(:show_id) }
	it { should respond_to(:irc_user_id) }
	it { should respond_to(:votes_count) }

	it { should be_valid }

	describe "when title is not present" do
		before { @title.title = nil }

		it { should_not be_valid }
	end

	describe "when title is more than 50 characters" do
		before { @title.title = "a" * 51 }

		it { should_not be_valid }
	end

	describe "when ircuser_id is not present" do
		before { @title.irc_user_id = nil }

		it { should_not be_valid }
	end

	describe "when show_id is not present" do
		before { @title.show_id = nil }

		it { should_not be_valid }
	end

	describe "when a title is submitted twice" do
		before { 
			title_dup = @title.dup
			title_dup.save
		}

		it { should_not be_valid }
	end

	describe "when a title is submitted with different letter case" do
		before { 
			title_dup = @title.dup
			title_dup.title = @title.title.upcase
			title_dup.save
		}

		it { should_not be_valid }
	end

end

