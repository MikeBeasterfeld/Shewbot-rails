require 'spec_helper'
require 'webmock/rspec'

describe TitlesController do

  let(:valid_session) { {token: create(:api).api_key} }

  # describe "GET index" do
  #   it "assigns all questions as @questions" do
  #     question = Question.create! valid_attributes
  #     get :index, {}
  #     assigns(:questions).should eq([question])
  #   end
  # end

  # describe "GET show" do
  #   it "assigns the requested question as @question" do
  #     question = Question.create! valid_attributes
  #     get :show, {:id => question.to_param}, valid_session
  #     assigns(:question).should eq(question)
  #   end
  # end

  # describe "GET new" do
  #   it "assigns a new question as @question" do
  #     get :new, {}, valid_session
  #     assigns(:question).should be_a_new(Question)
  #   end
  # end

  # describe "GET edit" do
  #   it "assigns the requested question as @question" do
  #     question = Question.create! valid_attributes
  #     get :edit, {:id => question.to_param}, valid_session
  #     assigns(:question).should eq(question)
  #   end
  # end

  describe "POST create" do
    before {
      Settings.live_url = 'http://example.com'
      stub_request(:get, Settings.live_url).to_return(:body => JSON_content())
    }

    describe "with an original title" do
      it "creates a new title" do
        expect {
          request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(create(:api).api_key)
          response = post :create, {format: :json, title: "This is a title", user: "User1", host: "10.10.10.10", username: "User1"}
          puts response.body
        }.to change(Title, :count).by(1)
      end
    end

    # describe "with invalid params" do
    #   it "assigns a newly created but unsaved question as @question" do
    #     # Trigger the behavior that occurs when invalid params are submitted
    #     Question.any_instance.stub(:save).and_return(false)
    #     post :create, {:question => { "question" => "invalid value" }}, valid_session
    #     assigns(:question).should be_a_new(Question)
    #   end

    #   it "re-renders the 'new' template" do
    #     # Trigger the behavior that occurs when invalid params are submitted
    #     Question.any_instance.stub(:save).and_return(false)
    #     post :create, {:question => { "question" => "invalid value" }}, valid_session
    #     response.should render_template("new")
    #   end
    # end
  end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested question" do
  #       question = Question.create! valid_attributes
  #       # Assuming there are no other questions in the database, this
  #       # specifies that the Question created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       Question.any_instance.should_receive(:update_attributes).with({ "question" => "MyString" })
  #       put :update, {:id => question.to_param, :question => { "question" => "MyString" }}, valid_session
  #     end

  #     it "assigns the requested question as @question" do
  #       question = Question.create! valid_attributes
  #       put :update, {:id => question.to_param, :question => valid_attributes}, valid_session
  #       assigns(:question).should eq(question)
  #     end

  #     it "redirects to the question" do
  #       question = Question.create! valid_attributes
  #       put :update, {:id => question.to_param, :question => valid_attributes}, valid_session
  #       response.should redirect_to(question)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the question as @question" do
  #       question = Question.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Question.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => question.to_param, :question => { "question" => "invalid value" }}, valid_session
  #       assigns(:question).should eq(question)
  #     end

  #     it "re-renders the 'edit' template" do
  #       question = Question.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Question.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => question.to_param, :question => { "question" => "invalid value" }}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested question" do
  #     question = Question.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => question.to_param}, valid_session
  #     }.to change(Question, :count).by(-1)
  #   end

  #   it "redirects to the questions list" do
  #     question = Question.create! valid_attributes
  #     delete :destroy, {:id => question.to_param}, valid_session
  #     response.should redirect_to(questions_url)
  #   end
  # end

end


def JSON_content
  return '{"live":true,"broadcast":{"title":"Amplified","slug":"amplified","show_art":"http://icebox.5by5.tv/images/broadcasts/35/cover.jpg"}}'
end
