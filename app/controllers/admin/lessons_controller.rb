class Admin::LessonsController < ApplicationController
  before_action :logged_in_user
  before_action :is_admin

  def index
  end

  def show
    @category = Category.find params[:category_id]
    @lesson = Lesson.find params[:id]
  end

  def new
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build
    word = @lesson.words.build
    4.times {word.answers.build}
  end

  def create
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build lesson_params
    if @category.save
      flash[:success] = "Lesson created"
      redirect_to admin_category_url @category
    else
      word = @lesson.words.build
      4.times {word.answers.build}
      render 'new'
    end
  end

  def edit
    @category = Category.find params[:category_id]
    @lesson = Lesson.find params[:id]
  end

  def update
    @category = Category.find params[:category_id]
    @lesson = Lesson.find params[:id]
    if @lesson.update_attributes lesson_params
      flash[:success] = "Lesson updated"
      redirect_to admin_category_lesson_url @category, @lesson
    else
      render 'edit'
    end
  end

  def destroy
    category = Category.find params[:category_id]
    Lesson.find(params[:id]).destroy
    flash[:success] = "Lesson deleted"
    redirect_to admin_category_url category
  end

  private
  def lesson_params
    params.require(:lesson).permit :title, words_attributes: [:id, :content, :_destroy, answers_attributes: [:id, :content, :correct, :_destroy]]
  end
end
