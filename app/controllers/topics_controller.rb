class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @posts = @topic.posts
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
    @post.user = current_user
    @post.topic = @topic
    authorize @post
    
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Error saving topic. Please try again."
      render :new
    end
  end

