class IdeasController < ApplicationController
before_action :require_user

def require_user
  render file: "/public/404" unless current_user?
end

  def index
    @user = User.find(params[:user_id])
  end



end
