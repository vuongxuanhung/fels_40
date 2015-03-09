class FollowersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def show
    @title = "Followers"
    @user = User.find params[:user_id]
    @users = @user.followers.paginate page: params[:page], per_page: 8
    render 'users/show_follow'
  end
end
