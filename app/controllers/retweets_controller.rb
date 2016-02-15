class RetweetsController < ApplicationController
    before_action :logged_in_user
    
    def create
        @retweet = Micropost.find(params[:retweeted_id])
        @micropost = Micropost.new
        @micropost.retweet(@retweet)
    end
    
    def destroy
    end
    
end
