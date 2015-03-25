class Admin::DashboardsController < Admin::AdminsController
  def home
    if logged_in?
      @lessons = Lesson.feed(current_user)
                       .paginate page: params[:page], per_page: 10
    end
  end
end
