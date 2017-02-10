class SummariesController < ApplicationController
  def create
    @summary = Summary.new(params.require(:summary).permit(:description, :public))
    authorize @summary
    @summary.post_id = params[:post_id]
    if @summary.save
        flash[:notice] = "Summary was saved." 
        redirect_to topic_post_summary_path(@summary.post.topic_id, @post.id, @summary.id)
    else 
        flash[:error] = "There was an error saving the summary. Please try again."
    end
  end 
    def new
      @topic = Topic.find(params[:topic_id])
      @post = Post.find(params[:post_id])
      @summary = Summary.new
      authorize @summary
    end
  
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def index
    @summary = Summary.all
  end
  
  def edit
     @summary = Summary.find(params[:id])
  end
  
  def update
     @summary = Summary.find(params[:id])
    if @summary.update_attributes(params.require(:summary).permit(:title, :body))
      flash[:notice] = "Summary was updated."
        redirect_to @post
    else
      flash[:error] = "There was an error saving the summary. Please try again" 
        render :edit
    end
  end
end
