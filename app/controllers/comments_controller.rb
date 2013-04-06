class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  before_filter :load_posting
  def index
    @comments = @posting.comments.all
    @user = User.where(:uid => @posting.user_id)[0]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = @posting.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = @posting.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = @posting.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    #binding.pry
    @comment = @posting.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        @comment.create_activity :create, owner: current_user
        #format.html { redirect_to root_url, notice: 'Comment was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = @posting.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
          #@comment.create_activity :update, owner: current_user
        format.html { redirect_to postings_path, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = @posting.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      #@comment.create_activity :destroy, owner: current_user
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  protected
  def load_posting
   @posting = Posting.find(params[:posting_id]) 
  end
end
