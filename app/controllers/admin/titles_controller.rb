class Admin::TitlesController < ApplicationController
  before_filter :check_admin, :except => :index

  def index
    @titles = Title.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @titles.as_json(:include => :irc_user) }
    end
  end

  def show
    @title = Title.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @title }
    end
  end

  def new
    @title = Title.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @title }
    end
  end

  def edit
    @title = Title.find(params[:id])
  end

  def create
    @title = Title.new(params[:title])

    respond_to do |format|
      if @title.save
        format.html { redirect_to admin_title_url(@title), notice: 'Title was successfully created.' }
        format.json { render json: @title, status: :created, location: @title }
      else
        format.html { render action: "new" }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @title = Title.find(params[:id])

    respond_to do |format|
      if @title.update_attributes(params[:title])
        format.html { redirect_to admin_title_url(@title), notice: 'Title was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @title = Title.find(params[:id])
    @title.destroy

    respond_to do |format|
      format.html { redirect_to admin_titles_url }
      format.json { head :no_content }
    end
  end
end
