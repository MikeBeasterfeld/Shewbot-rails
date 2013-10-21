require 'spec_helper'

describe Api do
	before do
		@api = Api.new(name: 'ApiUser')
	end

	subject { @api }

	it { should respond_to(:name) }
	it { should respond_to(:api_key) }

	it { should be_valid }

end
