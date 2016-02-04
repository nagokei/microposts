class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_user, only: [:show, :edit, :update]
  
  def show
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_user
    redirect_to root_path if @user != current_user
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :area, :password, :password_confirmation)
  end
end
