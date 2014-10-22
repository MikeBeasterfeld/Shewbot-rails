class QuestionsController < ApplicationController
  include TitlesHelper

  before_filter :check_api_key, only: [:create]
  respond_to :json

  def index
    @questions = Show.current_show.questions.with_irc_users

    Cache.visit(request.remote_ip)

    render json: @questions.as_json
  end

  def create
    question = Show.update_current_show(fetch_live_show_title).questions.new(question: params[:question])

    question.irc_user = IrcUser.find_or_create_by_name(params[:user])

    if question.show_id.nil?
      render json: { 'Show' => [ 'is not live' ]}, status: :unprocessable_entity
    elsif question.save
      render json: question, status: :created
    else
      render json: question.errors, status: :unprocessable_entity
    end
  end

end
