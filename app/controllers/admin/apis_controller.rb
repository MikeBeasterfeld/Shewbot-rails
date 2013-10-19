class Admin::ApisController < ApplicationController
  before_filter :check_admin
  
  def index
    @apis = Api.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @api }
    end
  end

  def show
    @api = Api.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api }
    end
  end

  def new
    @api = Api.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @api }
    end
  end

  def edit
    @api = Api.find(params[:id])
  end

  def create
    @api = Api.new(params[:api])

    respond_to do |format|
      if @api.save
        format.html { redirect_to admin_api_path(@api), notice: 'Irc user was successfully created.' }
        format.json { render json: @api, status: :created, location: @api }
      else
        format.html { render action: "new" }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @api = Api.find(params[:id])

    respond_to do |format|
      if @api.update_attributes(params[:api])
        format.html { redirect_to admin_api_path(@api), notice: 'Irc user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @api = Api.find(params[:id])
    @api.destroy

    respond_to do |format|
      format.html { redirect_to admin_api_url }
      format.json { head :no_content }
    end
  end
end
