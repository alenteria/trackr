

class PostsController < ApplicationController
  before_filter :authenticate_user!
  # GET /posts
  # GET /posts.json
  
   
  
  def index
    
   @posts = Post.find(:all, :order => "status_id")
    @user_record = User.all
    @assignment_record = Assignment.all
    @statuses = Status.all
    @categories = Category.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @user_record = User.all
    @assignment_record = Assignment.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @all_users = User.all
    @statuses = Status.all
    @categories = Category.all
    
    @assignments = @post.assignments.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @all_users = User.all
    @statuses = Status.all
    @categories = Category.all
    @assignments = @post.assignments.build
    @view = nil
    #check if user is one of assigned users
    
    assigned = false
    @post.assignments.each do |a|
      if current_user.id == a.user_id
        assigned = true
        break
      end
    end
    if @post.user == current_user
      render :template => "posts/full_edit"
    elsif assigned
       render :template => "posts/assigned_view"
    else
      render :text => "Restricted action!"
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    
      #random number generator
      key=SecureRandom.hex(5).upcase
      nkey="TCK:#{key}"
      params[:post][:namekey] = nkey
    
    params[:post][:user_id] = current_user.id
    params[:post][:status_id] = 1
    
    @post = Post.new(params[:post])
    
    
    params[:users][:id].each do |user|
      if !user.empty?
        @post.assignments.new(:user_id => user)
      end
    end
    
    respond_to do |format|
      
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
         
         
         users_size = 0
         params[:users][:id].each do |u|
           if !u.empty?
             users_size = users_size + 1
           end
         end
         
         
         
         if users_size < 1
            #do nothing
          elsif
            Assignment.delete_all(:post_id => params[:id])
            params[:users][:id].each do |user|
              if !user.empty?
                ass = Assignment.new(:post_id => params[:id], :user_id => user)
                ass.save
              end
            end
          end
        
        
       
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
  # @assignments= Assignment.find_by_post_id(params[:id])
    
    Assignment.delete_all(:post_id => params[:id])
    Comment.delete_all(:post_id => params[:id])
    
    @post.destroy
   # @assignments.destroy
    
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  def filter_by
    
    @posts = Post.where("#{params[:attr]}_id = ?", params[:id]).order("status_id")
    
    @user_record = User.all
    @assignment_record = Assignment.all
    @statuses = Status.all
    @categories = Category.all
    
    respond_to do |format|
      format.html { render :template => "posts/index"}
      format.json { render json: @posts }
    end
  end
  def mytickets
    ass = Assignment.where("user_id = ?", current_user.id)
    @posts = []
    index = 0
    ass.each do |a|
      @posts[index] = Post.find(a.post_id)
      index = index + 1
    end
    
    @user_record = User.all
    @assignment_record = Assignment.all
    @statuses = Status.all
    @categories = Category.all
    
    respond_to do |format|
      format.html { render :template => "posts/index"}
      format.json { render json: @posts }
    end
  end
  def mytickets
    ass = Assignment.where("user_id = ?", current_user.id)
    @posts = []
    index = 0
    ass.each do |a|
      @posts[index] = Post.find(a.post_id)
      index = index + 1
    end
    
    @user_record = User.all
    @assignment_record = Assignment.all
    @statuses = Status.all
    @categories = Category.all
    
    respond_to do |format|
      format.html { render :template => "posts/index"}
      format.json { render json: @posts }
    end
  end
end
