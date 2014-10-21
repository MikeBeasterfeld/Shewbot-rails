require 'spec_helper'

describe "questions/edit" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :question => "MyString",
      :show_id => 1,
      :irc_user_id => 1
    ))
  end

  it "renders the edit question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", question_path(@question), "post" do
      assert_select "input#question_question[name=?]", "question[question]"
      assert_select "input#question_show_id[name=?]", "question[show_id]"
      assert_select "input#question_irc_user_id[name=?]", "question[irc_user_id]"
    end
  end
end
