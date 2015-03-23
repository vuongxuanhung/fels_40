class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :results

  accepts_nested_attributes_for :answers, reject_if: lambda {|a| a[:content].blank?},
                                                      allow_destroy: true

  validates :content, presence: true

  scope :learned, ->(user){where id: Result.select(:word_id).where(lesson: user.lessons)}
  scope :not_learned, ->(user){where.not id: Result.select(:word_id).where(lesson: user.lessons)}
  scope :filter_with_category, ->(category){where(category: category) if category.present?}
  scope :random_20_words, ->(user){Word.not_learned(user).limit(20).order("RAND()")}
end
