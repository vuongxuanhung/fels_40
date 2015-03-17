class WordsController < ApplicationController
  before_action :logged_in_user

  def index
    @list_categories = Category.all.map(&:title)
    category = Category.first
    @word_list = category.words
  end
end
