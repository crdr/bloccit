class SummaryController < ApplicationController
  def create
   @topic = Topic.new(params.require(:topic).permit(:description, :public))
   if @summary.save
    flash[:notice] = "Summary was saved." 
    redirect_to topic_post_path(@post.topic_id @post.id)
   else 
     flash[:error] = "There was an error saving the summary. Please try again."
   end
  end

  def new
  end
  
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:topic_id])
    @summary = Summary.find(params[:post_id])
  end
  
  def index
  @summary = Summary.all
  end
end
