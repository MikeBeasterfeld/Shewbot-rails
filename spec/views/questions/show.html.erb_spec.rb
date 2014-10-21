require 'spec_helper'

describe "questions/show" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :question => "Question",
      :show_id => 1,
      :irc_user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Question/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
