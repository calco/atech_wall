class PostsController < ApplicationController
  
  before_filter :login_required, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id], :include => { :likes => :user})
    @likers = Post.find(params[:id]).users_who_liked.map(&:username)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, :notice => "Successfully destroyed post."
  end

  ##################
  # Custom Methods #
  ##################

  def like
    @post = Post.find(params[:post])
    @user = current_user
    Like.create(:user_id => @user.id, :post_id => @post.id)
    redirect_to @post
  end

  def unlike
    @post = Post.find(params[:post])
    @user = current_user
    @like = @user.likes.where(:post_id => @post).first.destroy
    redirect_to @post
  end

end