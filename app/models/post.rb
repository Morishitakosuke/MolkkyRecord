class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }

  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
end
