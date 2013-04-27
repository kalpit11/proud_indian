class PostingsController < ApplicationController
  # GET /postings
  # GET /postings.json

  # def texting
  #   render :text => "I'm just printing a dummy text"
  # end
    skip_before_filter :authenticate_user!
  def index
    if params[:search] 
      @postings = Posting.where(:caption=>params[:search][:caption])
    else
      @postings = Posting.order("created_at desc").page(params[:page]).per(2)
    end

    @activities = PublicActivity::Activity.order("created_at desc").page(params[:page]).per(5)
    @poll = Poll.where(:dated=>Date.today)[0]
    
    if @poll
      @poll_answer = @poll.poll_answers.new
    end
    
    @previous_poll=Poll.where(:dated=>Date.today-1)[0]
    if @previous_poll
      @total_count = @previous_poll.poll_answers.count
      @yes_count = (@previous_poll.poll_answers.where(:answer=>"Yes").count/@total_count.to_f)*100
      @no_count = (@previous_poll.poll_answers.where(:answer=>"No").count/@total_count.to_f)*100
      @cant_say_count = (@previous_poll.poll_answers.where(:answer=>"Cant_Say").count/@total_count.to_f)*100
    end
    if current_user
       @profile = current_user.profile
      # if @profile = nil
      #   @profile = Profile.new
      # end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end

  end

  # GET /postings/1
  # GET /postings/1.json
  def show
    @posting = Posting.find(params[:id])
    @activities = PublicActivity::Activity.order("created_at desc").page(params[:page]).per(5)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @posting }
    end
  end

  # GET /postings/new
  # GET /postings/new.json
  def new
    #binding.pry
    @posting = Posting.new
    @activities = PublicActivity::Activity.order("created_at desc").page(params[:page]).per(5)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @posting }
    end
  end

  # GET /postings/1/edit
  def edit
    @activities = PublicActivity::Activity.order("created_at desc").page(params[:page]).per(5)
    @posting = Posting.find(params[:id])
  end

  # POST /postings
  # POST /postings.json
  def create
    #binding.pry
    @posting = Posting.new(params[:posting])

    respond_to do |format|
      if @posting.save
        User.all.each do |u|
          PostMailer.new_post(@posting,u).deliver
        end
        @posting.create_activity :create, owner: current_user
        format.html { redirect_to root_url, notice: 'Posting was successfully created.' }
        format.json { render json: @posting, status: :created, location: @posting }
      else
        format.html { render action: "new" }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /postings/1
  # PUT /postings/1.json
  def update
    @posting = Posting.find(params[:id])

    respond_to do |format|
      if @posting.update_attributes(params[:posting])
        format.html { redirect_to postings_path, notice: 'Posting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postings/1
  # DELETE /postings/1.json
  def destroy
    @posting = Posting.find(params[:id])
    @posting.destroy

    respond_to do |format|
      #@posting.create_activity :destroy, owner: current_user
      format.html { redirect_to postings_url }
      format.json { head :no_content }
    end
  end

  def add_post_like
    @posting = Posting.find(params[:posting_id])
    @post_like = @posting.post_likes.new(:user_id=>current_user.id,:user_name=>current_user.name,:posting_id=>params[:posting_id])
    if @post_like.save
      @post_like.create_activity :create, owner: current_user
      redirect_to postings_path
    end
  end

  def add_post_unlike
    @posting = Posting.find(params[:posting_id])
    @post_unlike = @posting.post_unlikes.new(:user_id=>current_user.id,:user_name=>current_user.name,:posting_id=>params[:posting_id])
    if @post_unlike.save
      @post_unlike.create_activity :create, owner: current_user
      redirect_to postings_path
    end
  end

end
