class UsersController < ApplicationController
  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render :new, message: {"There was an error, please login again."}, status: :unprocessable_entity
    end
  end

  private
    def user_params
      require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
