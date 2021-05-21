class Tag < ApplicationRecord
  validates :name, presence: true, length: { maximum:100}
  has_many :tag_post, dependent: :destroy
  has_many :post, through: :tag_post
end
