class AdvertisementsController < ApplicationController
  def index
    @advertisements = Post.all 
  end

  def show
    @advertisements = Post.find(params[:id])
  end

  def new
  end

  def edit
  end
end
