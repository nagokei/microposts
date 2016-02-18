class RetweetController < ApplicationController
  def create
    @micropost = Micropost.find(params[:original_id])
    current_user.retweet(@micropost)
  end
end
