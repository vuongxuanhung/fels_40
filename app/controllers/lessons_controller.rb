class LessonsController < ApplicationController
  before_action :logged_in_user

  MAX_WORD = 20

  def new
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build user_id: current_user.id
    words = @category.words.random_20_words current_user
    if words.count < MAX_WORD
      flash[:danger] = "Not enough 20 words to start new lesson"
      redirect_to categories_url
      return
    end
    @results = []
    20.times do |n|
      @result = @lesson.results.build
      @result.word = words[n]
      @results << @result
    end
  end

  def show
    @category = Category.find params[:category_id]
    @lesson = Lesson.find params[:id]
  end

  def create
    @category = Category.find params[:category_id]
    @lesson = @category.lessons.build lesson_params
    @lesson.user_id = current_user.id
    if @lesson.save
      redirect_to category_lesson_path(@category, @lesson)
    else
      render 'new'
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit :correct_answers, results_attributes: [:id, :word_id, :answer_id]
  end
end

