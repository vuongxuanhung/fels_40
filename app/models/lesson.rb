class Lesson < ActiveRecord::Base
  has_many :words, dependent: :destroy

  accepts_nested_attributes_for :words, reject_if: lambda {|a| a[:content].blank?}, allow_destroy: true

  validates :title, presence: true, length: {maximum:100}

end
