class Category < ActiveRecord::Base
  has_many :lessons, dependent: :destroy

  validates :title, presence: true, length: {maximum: 100}
  validates :content, presence: true, length: {maximum: 255}
end
