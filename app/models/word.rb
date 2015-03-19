class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, reject_if: lambda {|a| a[:content].blank?}, allow_destroy: true

  validates :content, presence: true

  scope :learned, ->(user){where id: Result.select(:word_id).where(lesson: Lesson.where(user: user))}
  scope :not_learned, ->(user){where.not id: Result.select(:word_id).where(lesson: Lesson.where(user: user))}
  scope :filter_with_category, ->(category){where(category: category) if category.present?}
end
