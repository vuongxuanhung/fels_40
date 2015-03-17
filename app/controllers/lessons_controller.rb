class LessonsController < ApplicationController
  before_action :logged_in_user

  def index
    @category = Category.find params[:category_id]
  end
end
