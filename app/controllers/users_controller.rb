class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def edit

  end

  def update
    if current_user.update(user_params)
      redirect_to current_user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :zip_code, :dob)
  end

end
