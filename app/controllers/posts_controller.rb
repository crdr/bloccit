class PostsController < ApplicationController
  
  skip_before_action :flash_attack, only: [:new, :index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new
   @post = Post.new
   authorize @post 
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    @post.user = current_user
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
       render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  protected
  
  def flash_attack
      flash[:error] = "You must be logged in to access this section. Holla!"
  end
  def update
    # params: The user perovided data from edit.html.erb
     # @post: The row or record that you want to find
     # update_attributes: The method that takes params and passes to @post so that it can be updated.
    
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
end 
