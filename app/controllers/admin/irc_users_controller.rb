class Admin::IrcUsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @irc_users = IrcUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @irc_users }
    end
  end

  def show
    @irc_user = IrcUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @irc_user }
    end
  end

  def new
    @irc_user = IrcUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @irc_user }
    end
  end

  def edit
    @irc_user = IrcUser.find(params[:id])
  end

  def create
    @irc_user = IrcUser.new(params[:irc_user])

    respond_to do |format|
      if @irc_user.save
        format.html { redirect_to admin_irc_user_url(@irc_user), notice: 'Irc user was successfully created.' }
        format.json { render json: @irc_user, status: :created, location: @irc_user }
      else
        format.html { render action: "new" }
        format.json { render json: @irc_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @irc_user = IrcUser.find(params[:id])

    respond_to do |format|
      if @irc_user.update_attributes(params[:irc_user])
        format.html { redirect_to admin_irc_user_url(@irc_user), notice: 'Irc user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @irc_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @irc_user = IrcUser.find(params[:id])
    @irc_user.destroy

    respond_to do |format|
      format.html { redirect_to admin_irc_users_url }
      format.json { head :no_content }
    end
  end
end
