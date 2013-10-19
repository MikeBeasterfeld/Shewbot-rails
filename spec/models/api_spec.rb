require 'spec_helper'

describe Api do
	before { @api = Api.new(name: 'ApiUser') }

	subject { @api }

	it { should be_valid }
	
end
