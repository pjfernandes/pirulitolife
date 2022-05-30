class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :comments, dependent: :destroy

  validates :photo, presence: true
  validates :legend, presence: true
end
