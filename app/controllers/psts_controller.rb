class PstsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /psts
  # GET /psts.json
  def index
    if !user_signed_in? 
      @psts = Pst.where(:published => true)
    # @psts = Pst.all
     else
     @psts = Pst.where(:user_id => current_user.id)
    end
     respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @psts }
      end
  end

  # GET /psts/1
  # GET /psts/1.json
  def show
      @pst = Pst.find(params[:id])

      respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @pst }
    end
  end

  # GET /psts/new
  # GET /psts/new.json
  def new
    @pst = Pst.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @pst }
    end
  end

  # GET /psts/1/edit
  def edit
    @pst = Pst.find(params[:id])
  end

  # POST /psts
  # POST /psts.json
  def create
    @pst = Pst.new(params[:pst])
    @pst.user_id = current_user.id
    respond_to do |format|
      if @pst.save
        format.html { redirect_to @pst, :notice => 'Post was successfully created.' }
        format.json { render :json => @pst, :status => :created, :location => @pst }
      else
        format.html { render :action => "new" }
        format.json { render :json => @pst.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /psts/1
  # PUT /psts/1.json
  def update
    @pst = Pst.find(params[:id])
    if current_user.id == @pst.user.id
      respond_to do |format|
        if @pst.update_attributes(params[:pst])
          format.html { redirect_to @pst, :notice => 'Post was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @pst.errors, :status => :unprocessable_entity }
        end
      end
    else
      flash[:notice] = 'You are not authorized to update this post' and redirect_to :action=>"show"
    end
  end

  # DELETE /psts/1
  # DELETE /psts/1.json
  def destroy
    @pst = Pst.find(params[:id])
    if current_user.id == @pst.user.id
      @pst.destroy
      respond_to do |format|
        format.html { redirect_to psts_url,  :notice => 'Post was successfully deleted.'}
        format.json { head :no_content }
      end
    else
      flash[:notice] = 'You are not authorized to delete this post' and render 'psts/show'
    end
  end
end
