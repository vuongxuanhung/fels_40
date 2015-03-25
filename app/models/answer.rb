class Answer < ActiveRecord::Base
  belongs_to :word
  has_many :results

  validates :content, presence: true

  scope :correct, ->{find_by correct: true}
end
