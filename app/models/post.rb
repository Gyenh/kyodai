class Post < ApplicationRecord
  validates :title, :content, :link, presence: true

  validates :title, length: { maximum: 28 }
  validates :content, length: { maximum: 100 }

  has_many :comments, dependent: :destroy
  belongs_to :user
end
