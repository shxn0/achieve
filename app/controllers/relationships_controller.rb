class RelationshipsController < ApplicationController

  before_action :authenticate_user!
  respond_to :js


  def create

    #params[:relationship][:followed_id]は外部キーのIDと一致＝数字が取得される
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_with @user
    #p params[:relationship]ではfollowed_idが確認できる
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
  end
end
