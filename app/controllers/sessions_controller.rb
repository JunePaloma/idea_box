class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: user_params[:username])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
  private

    def user_params
      params.require(:session).permit(:username, :password)
    end
end
