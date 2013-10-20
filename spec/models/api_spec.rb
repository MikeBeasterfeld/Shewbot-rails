require 'spec_helper'

describe Api do
	before { @api = Api.new(name: 'ApiUser') }

	subject { @api }

	it { should respond_to(:name) }
	it { should respond_to(:api_key) }

	it { should be_valid }

	describe "valid if the key is 32 characters long" do
		before { @api.api_key = 'a' * 32 }
		it { should be_valid }
	end

	describe "invalid if the key is more than 32 characters long" do
		before { @api.api_key = 'a' * 33 }
		it { should_not be_valid }
	end

	describe "invalid if the key is less than 32 characters long" do 
		before { @api.api_key = 'a' * 31 }
		it { should_not be_valid }
	end

end
