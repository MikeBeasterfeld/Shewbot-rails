class ShowsController < ApplicationController

  def current
    @show = Show.current_show

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @show }
    end
  end

  def index
    @shows = Show.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shows }
    end
  end

  def show
    @show = Show.find(params[:id])
    @titles = @show.titles.order("votes_count DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @show }
    end
  end
end
