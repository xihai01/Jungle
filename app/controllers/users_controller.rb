class UsersController < ApplicationController
  def new # for rendering signup page
    @user = User.new
  end

  def create # for storing new user into db
    user = User.new(user_params)
    if user.save
      session[:user_id]= user.id
      redirect_to '/'
    else
      redirect_to '/users/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
