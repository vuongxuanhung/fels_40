class Admin::WordsController < ApplicationController
  before_action :logged_in_user
  before_action :is_admin

  def new
    @category = Category.find params[:category_id]
    @word = @category.words.build
    4.times {@word.answers.build}
  end

  def create
    @category = Category.find params[:category_id]
    @word = @category.words.build word_params
    if @category.save
      flash[:success] = "Word created"
      redirect_to admin_category_url @category
    else
      4.times {@word.answers.build}
      render 'new'
    end
  end

  def edit
    @category = Category.find params[:category_id]
    @word = Word.find params[:id]
  end

  def update
    @category = Category.find params[:category_id]
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash[:success] = "Word updated"
      redirect_to admin_category_url @category
    else
      render 'edit'
    end
  end

  def destroy
    category = Category.find params[:category_id]
    Word.find(params[:id]).destroy
    flash[:success] = "word deleted"
    redirect_to admin_category_url category
  end

  private
  def word_params
    params.require(:word).permit :content, answers_attributes: [:id, :content, :correct, :_destroy]
  end
end
