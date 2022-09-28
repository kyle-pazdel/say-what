class UsersController < ApplicationController
  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to "/", notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, notice: "There was an error, please login again.", status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params
      require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

