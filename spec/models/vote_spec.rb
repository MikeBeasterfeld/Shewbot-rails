require 'spec_helper'

describe Vote do
	before do
		title = Title.create({title: 'title', irc_user_id: 1, show_id: 1})
		title.save
		@vote = title.votes.new(voterip: '10.10.10.10')
	end

	subject { @vote }

	it { should be_valid }

	it { should respond_to(:title_id) }	
	it { should respond_to(:voterip) }

	describe "duplicate check" do
		before {
			vote_dup = @vote.dup
			vote_dup.save
		}

		it { should_not be_valid }
	end

	describe "should be deleted when a title is deleted" do
		before {
			@vote.save
			title = @vote.title
			title.destroy
		}

		it {
			expect { @vote.reload }.to raise_error
		}
	end

end

