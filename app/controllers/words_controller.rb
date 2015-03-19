class WordsController < ApplicationController
  before_action :logged_in_user

  def index
    @categories = Category.all

    if params[:filter]
      @category = Category.find_by id: params[:filter][:category_id]
      @words = Word.filter_with_category @category
      @words = @words.send "#{params[:filter][:state]}", current_user unless params[:filter][:state] == 'all'
    else
      @words = Word.all
    end

    respond_to do |format|
      format.html
      format.js
      format.pdf do
        pdf = WordPdf.new @words
        send_data pdf.render, filename: 'word_list.pdf', type: 'application/pdf'
      end
    end
  end
end
