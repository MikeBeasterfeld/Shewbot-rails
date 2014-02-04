class IrcUsersController < ApplicationController

  def show
    @irc_user = IrcUser.find(params[:id])
		@titles = @irc_user.titles.order("created_at DESC")
		@vote_count = @titles.sum('votes_count')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @irc_user }
    end
  end

end  