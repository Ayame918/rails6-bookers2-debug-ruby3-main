class RelationshipsController < ApplicationController
  
    before_action :authenticate_user!
    
    #ユーザーをフォローする
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end
  
  #ユーザーのフォローを解除する
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to  request.referer
  end
  
  #特定のユーザーがフォローしているユーザーの一覧を表示する
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  
  # 特定のユーザーをフォローしているユーザーの一覧を表示する
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
