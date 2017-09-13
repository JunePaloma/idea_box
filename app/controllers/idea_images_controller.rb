class IdeaImagesController < ApplicationController

  def new
    @idea = Idea.find(params[:idea_id])
    @idea_image = IdeaImage.new
  end

  def create
  IdeaImage.create(image_id: params[:idea_image][:image_id], idea_id: params[:idea_id])
  binding.pry
  end


end
