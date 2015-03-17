class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, reject_if: lambda {|a| a[:content].blank?}, allow_destroy: true

  validates :content, presence: true
end
