class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :followings, :followers]
  before_action :logged_in_user, only: [:edit, :update]
  
  def show
    @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(1)
    
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
  
  def followings
    @followings = @user.following_users
  end
  
  def followers
    @followers = @user.follower_users
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :area, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
