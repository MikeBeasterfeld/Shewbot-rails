require 'spec_helper'

describe Authorization do

	before do
		@auth = Authorization.new(provider: 'twitter', uid: 'asdfjkl', user_id: 1)
	end

	subject { @auth }

	it { should respond_to(:provider) }	

	it { should respond_to(:uid) }	

end
