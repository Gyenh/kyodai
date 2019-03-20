class Post < ApplicationRecord
  validates :title, :content, :link, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user
end
