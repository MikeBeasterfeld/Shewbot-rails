class StaticPagesController < ApplicationController
  def home
  	current_show = Show.current_show
  	if current_show
  		@current_show_title = current_show.current
  	else
  		@current_show_title = "No shows yet"
  	end
  end

  def help
  end

  def about
  end
end
