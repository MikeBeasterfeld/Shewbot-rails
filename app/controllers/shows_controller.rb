class ShowsController < ApplicationController

  def current
    @show = Show.current_show

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @show }
    end
  end
end
