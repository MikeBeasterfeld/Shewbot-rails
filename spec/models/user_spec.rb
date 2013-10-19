require 'spec_helper'

describe User do
	before do
		@user = User.new(name: 'bob')
	end

	subject { @user }

	it { should respond_to(:name) }	
	it { should respond_to(:admin) }

	it { @user.admin?.should be_false }

end

describe User do
	before do
		@user = User.new(name: 'danbenjamin', admin: true)
	end

	subject { @user }

	it { should respond_to(:name) }	
	it { should respond_to(:admin) }

	it { @user.admin?.should be_true }

end
