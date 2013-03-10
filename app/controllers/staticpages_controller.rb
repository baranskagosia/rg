class StaticpagesController < ApplicationController
  before_filter :check_user , :except => [:index, :show, :show_by_slug]
  # GET /staticpages
  # GET /staticpages.json
  def index
    @staticpages = Staticpage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @staticpages }
    end
  end

  # GET /staticpages/1
  # GET /staticpages/1.json
  def show
    @staticpage = Staticpage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @staticpage }
    end
  end

  # GET /staticpages/new
  # GET /staticpages/new.json
  def new
    @staticpage = Staticpage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @staticpage }
    end
  end

  # GET /staticpages/1/edit
  def edit
    @staticpage = Staticpage.find(params[:id])
  end

  # POST /staticpages
  # POST /staticpages.json
  def create
    @staticpage = Staticpage.new(params[:staticpage])

    respond_to do |format|
      if @staticpage.save
        format.html { redirect_to @staticpage, notice: 'Staticpage was successfully created.' }
        format.json { render json: @staticpage, status: :created, location: @staticpage }
      else
        format.html { render action: "new" }
        format.json { render json: @staticpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /staticpages/1
  # PUT /staticpages/1.json
  def update
    @staticpage = Staticpage.find(params[:id])

    respond_to do |format|
      if @staticpage.update_attributes(params[:staticpage])
        format.html { redirect_to @staticpage, notice: 'Staticpage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @staticpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staticpages/1
  # DELETE /staticpages/1.json
  def destroy
    @staticpage = Staticpage.find(params[:id])
    @staticpage.destroy

    respond_to do |format|
      format.html { redirect_to staticpages_url }
      format.json { head :no_content }
    end
  end
def show_by_slug
    @staticpage = Staticpage.find_by_slug!(params[:slug])
    @about_active = true if @staticpage.slug == "about"
    @contact_active = true if @staticpage.slug == "contact"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @staticpage }
    end
  end
  private
    def check_user
      if user_signed_in?
      else
          redirect_to new_user_session_path 
          #   render "" do wyświetlania widoków 
          #redirect_to "ścieżka" # to przekopiuj do ścieżki
          #responsed to [format]
      end
  end
  # GET /staticpages/new
  # GET /staticpages/new.json
end
