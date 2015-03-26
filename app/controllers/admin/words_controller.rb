class Admin::WordsController < Admin::AdminsController
  def new
    @category = Category.find params[:category_id]
    @word = @category.words.build
    4.times {@word.answers.build}
  end

  def edit
    @category = Category.find params[:category_id]
    @word = Word.find params[:id]
  end

  def update
    @category = Category.find params[:category_id]
    @word = Word.find params[:id]
    debugger
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

  def category_params
    params.require(:category).permit :title,
                                  words_attributes: [:id, :content, :_destroy,
                                  answers_attributes: [:id, :content, :correct, :_destroy]]
  end
end
