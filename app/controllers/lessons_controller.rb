class LessonsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :is_admin

  def index
    @lessons = Lesson.paginate page: params[:page], per_page: 8
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  def new
    @lesson = Lesson.new
    word = @lesson.words.build
    4.times {word.answers.build}
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:danger] = "Lesson created"
      redirect_to @lesson
    else
      word = @lesson.words.build
      4.times {word.answers.build}
      render 'new'
    end
  end

  def edit
    @lesson = Lesson.find params[:id]
  end

  def update
    # debugger
    @lesson = Lesson.find params[:id]
    if @lesson.update_attributes lesson_params
      flash[:success] = "Lesson updated"
      redirect_to @lesson
    else
      render 'edit'
    end
  end

  def destroy
    Lesson.find(params[:id]).destroy
    flash[:success] = "Lesson deleted"
    redirect_to lessons_url
  end

  private
  def lesson_params
    params.require(:lesson).permit :title, words_attributes: [:id, :content, :_destroy, answers_attributes: [:id, :content, :correct, :_destroy]]
  end

  def is_admin
    redirect_to root_url unless current_user.admin?
  end
end
