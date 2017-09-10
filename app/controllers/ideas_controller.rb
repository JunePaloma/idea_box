class IdeasController < ApplicationController
before_action :require_user

def require_user
  @user = User.find(params[:user_id])
  if current_user.nil?
    render file: "/public/404"
  elsif  current_user != @user
    redirect_to user_ideas_path(current_user)
  end
end

  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @categories = Category.all
    @idea = @user.ideas.new
  end

  def create
    @user = User.find(params[:user_id])
  
    @idea = @user.ideas.create(idea_params)

    redirect_to user_ideas_path(@user)
  end
  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id)
  end

end
