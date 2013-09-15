class BidsController < ApplicationController
before_action :signed_in_user

def create
  @post = Post.find(params[:bid][:post_id])
  current_user.bid!(@post)
  respond_to do |format|
    format.html { redirect_to @post }
    format.js
  end
end

def destroy
  @post = Bid.find(params[:id]).post
  current_user.unbid!(@post)
  respond_to do |format|
    format.html { redirect_to @post }
    format.js
  end
end
  end