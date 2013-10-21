class StaticPagesController < ApplicationController
  def home
  	@current_show = Show.current_show
  end

  def help
  end

  def about
  end
end
