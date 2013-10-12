class CurrenttitlesController < ApplicationController

  # GET /currenttitles
  # GET /currenttitles.json
  def index
    @titles = Show.last.titles.all(:joins => :irc_user)

    respond_to do |format|
      format.html
      format.json { render json: @titles }
    end
  end
end


#[{"created_at":"2013-10-11T04:40:00Z","id":1,"irc_user_id":1,"show_id":1,"title":"sample","title_lc":"sample","updated_at":"2013-10-11T04:46:45Z","votes_count":0},{"created_at":"2013-10-11T04:49:00Z","id":2,"irc_user_id":null,"show_id":1,"title":"sample title","title_lc":null,"updated_at":"2013-10-11T04:49:00Z","votes_count":0},{"created_at":"2013-10-12T05:37:22Z","id":3,"irc_user_id":1,"show_id":1,"title":"creative title","title_lc":null,"updated_at":"2013-10-12T05:37:22Z","votes_count":1},{"created_at":"2013-10-12T05:59:00Z","id":4,"irc_user_id":1,"show_id":1,"title":"Blah blah","title_lc":"yeah","updated_at":"2013-10-12T05:59:57Z","votes_count":0}]