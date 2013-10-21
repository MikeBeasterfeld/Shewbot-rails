class TitlesController < ApplicationController
	before_filter :check_api_key, only: [:create]
	respond_to :json

  def index
    @titles = Show.current_show.titles.all

    render json: @titles.as_json(:include => :irc_user)
  end

  def upvote
		title = Title.find(params[:id])

		if title
			vote = title.votes.new(voterip: request.remote_ip)

			if vote.save
				render json: vote, status: :created
			else
				render json: vote.errors, status: :unprocessable_entity
			end
		end
  end

  def create
    title = Show.update_current_show(fetch_live_show_title).titles.new(param[:title])

  	title.irc_user = IrcUser.find_or_create_by_name(params[:user][:name])

    if title.save
      render json: title, status: :created
    else
      render json: title.errors, status: :unprocessable_entity
    end
  end

end
