class Record < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :user_id, presence: true
    validates :name, presence: true
  end
end
