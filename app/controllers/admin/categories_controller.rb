class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :is_admin

  def index
    @categories = Category.paginate page: params[:page], per_page: 10
  end

  def show
    @category = Category.find params[:id]
    @lessons = @category.lessons.paginate page: params[:page], per_page: 8
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Category created"
      redirect_to admin_category_url @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes category_params
      flash[:success] = "Category updated"
      redirect_to admin_category_url @category
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to admin_categories_url
  end

  private
  def category_params
    params.require(:category).permit :title, :content
  end
end
