class Admin::VisitorsController < ApplicationController
  before_filter :check_admin

  def index
    @visitors = Cache.visitor_hash

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
  