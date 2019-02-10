class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.password != @user.password_confirmation || @user.password.nil? || @user.password.empty?
        redirect_to users_path
    else
        @user.save
        session[:user_id] = @user.id
        redirect_to homepage_path
    end
    # if @user.save
    #     session[:user_id] = @user.id
    #     redirect_to homepage_path
    # else
    #     redirect_to users_path
    # end
  end

  def new
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end