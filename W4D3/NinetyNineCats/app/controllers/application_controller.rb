class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token

      redirect_to cats_url
    else
      render :new
    end
  end

  def logged_in
    if session[:session_token] && params[:_method] != "delete"
      redirect_to cats_url
    end
  end

  def check_current_owner
    @cat = Cat.find(params[:id])
    cats = current_user.cats.where("cats.id = ?", @cat.id).to_a
    !cats.empty?
  end


end
