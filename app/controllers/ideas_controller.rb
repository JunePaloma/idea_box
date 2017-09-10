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

end
