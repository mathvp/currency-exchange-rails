class UserController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.save
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :cpf)
  end
end