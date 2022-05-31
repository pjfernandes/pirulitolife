class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, length: { minimum: 4, maximum: 30 }
end
