class Admin::AdminsController< ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  layout "admin/admin"
  before_action :logged_in_user
  before_action :is_admin

  private
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end

  def is_admin
    redirect_to root_url unless current_user.admin?
  end
end
