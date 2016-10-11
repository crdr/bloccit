class PostsController < ApplicationController
    skip_before_action :flash_attack, only: [:new, :index]

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end
  
  def new
   @topic = Topic.find(params[:topic_id])
   @post = Post.new
   authorize @post 
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    @post.user = current_user
    @post.topic_id = params[:topic_id]
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to topic_post_path(@post.topic_id, @post.id)
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
    # params: The user provided data from edit.html.erb
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
