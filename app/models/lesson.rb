class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :results, dependent: :destroy

  accepts_nested_attributes_for :results

  following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
  scope :feed, ->(user){where "user_id = :user_id OR user_id IN(#{following_ids})", user_id: user.id}

  before_save :count_correct_answers

  def count_correct_answers
    counter = self.results.select{|result| result.answer == result.answers.find_by(correct: true)}.count
    self.correct_answers = counter
  end
end
