class LinksController < ApplicationController
  include TitlesHelper

  before_filter :check_api_key, only: [:create]
  respond_to :json

  def index
    @links = Show.current_show.links.with_irc_users

    Cache.visit(request.remote_ip)

    render json: @links.as_json
  end

  def create
    link = Show.update_current_show(fetch_live_show_title).links.new(url: params[:url])

    link.irc_user = IrcUser.find_or_create_by_name(params[:user])

    if link.save
      render json: link, status: :created
    else
      render json: link.errors, status: :unprocessable_entity
    end
  end

end