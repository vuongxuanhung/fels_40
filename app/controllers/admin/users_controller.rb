class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :is_admin

  def index
    @users = User.not_current_user(current_user).paginate page: params[:page], per_page: 8
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_url
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
