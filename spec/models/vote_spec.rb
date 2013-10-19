require 'spec_helper'

describe Vote do
	before do
		@vote = Vote.new(title_id: 1, voterip: '10.10.10.10')
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

end

