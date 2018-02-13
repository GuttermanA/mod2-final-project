class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
