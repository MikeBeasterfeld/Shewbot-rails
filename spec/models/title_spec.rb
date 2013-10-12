require 'spec_helper'

describe Title do 

	before { @title = Title.new(title: "Sample Title", show_id: 1, ircuser_id: 1, votes_count: 0) }

	subject { @title }

	it { should respond_to(:title) }
	it { should respond_to(:show_id) }
	it { should respond_to(:ircuser_id) }
	it { should respond_to(:votes_count) }

	it { should be_valid }

	describe "when title is not present" do
		before { @title.title = " " }

		it { should_not be_valid }
	end

	describe "when title is more than 50 characters" do
		before { @title.title = "a" * 51 }

		it { should_not be_valid }
	end

	describe "when ircuser_id is not present" do
		before { @title.ircuser_id = " " }

		it { should_not be_valid }
	end

	describe "when show_id is not present" do
		before { @title.show_id = " " }

		it { should_not be_valid }
	end

	describe "when vote is added"

end

#:ircuser_id, :show_id, :title, :title_lc