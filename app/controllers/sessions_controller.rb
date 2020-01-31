class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'You have successfully log in'
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'logout successfully'
    redirect_to root_path
  end

  private

  def logged_in_redirect
    return unless logged_in?

    flash[:success] = 'You are already looged in'
    redirect_to root_path
  end
end
