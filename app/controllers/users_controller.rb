class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      empty_error
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      empty_error
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :cpf)
  end

  def empty_error
    @user.errors.add(:base, 'Você deve informar todos os dados do usuário')
  end
end