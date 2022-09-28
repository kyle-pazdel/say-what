class SessionsController < ApplicationController

  def new
    render template: "sessions/new"
  end
 
  def create
    user = set_user
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      flash[:alert] = "Email/password combination is invalid"
      redirect_to "/login"
    end
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end

  private
    def set_user
      User.find_by(email: params[:email])
    end
end
