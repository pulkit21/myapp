class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @comments = Comment.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @pst = Pst.find(params[:pst_id])
    @comment = @pst.comments.build(params[:comment])
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @pst
    
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user.id
      respond_to do |format|
        if @comment.update_attributes(params[:comment])
          format.html { redirect_to @comment, :notice => 'Comment was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @comment.errors, :status => :unprocessable_entity }
        end
      end
    else
      flash[:notice] = 'You are not authorized to update this comment make your own comments' and redirect_to :action=>"new"
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user.id
      @comment.destroy
      redirect_to @comment.pst
    else
      flash[:notice] = 'You are not authorized to delete this comment' and redirect_to :back
    end
  end
end
