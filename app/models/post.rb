class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }

  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :users

  mount_uploader :image, ImageUploader
end
