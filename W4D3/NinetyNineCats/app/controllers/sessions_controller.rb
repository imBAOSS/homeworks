class SessionsController < ApplicationController
  before_action :logged_in

  def new
    render :new
  end

  def create
    login_user!
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    render :new
  end
end
