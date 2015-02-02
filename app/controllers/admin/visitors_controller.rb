class Admin::VisitorsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @visitors = Cache.visitor_hash

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
  