class UsersController < ApplicationController

  def show
    render :show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_link(@user)
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password_digest, :session_token)
    end
end
