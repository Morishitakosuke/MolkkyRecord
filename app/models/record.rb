class Record < ApplicationRecord
  belongs_to :user
  serialize :score, Array
  serialize :enemyscore, Array

  with_options presence: true do
    validates :user_id
  end
  
  with_options length: { maximum: 12 } do
    validates :name_a, presence: true
    validates :name_b
    validates :name_c
    validates :enemyname_a
    validates :enemyname_b
    validates :enemyname_c
  end

  with_options length: { maximum: 15 } do
    validates :teamname
    validates :enemyteam
    validates :title
  end

  with_options allow_blank: true, numericality: { only_integer: true }, length: { in: 0..12 } do
    validates :score
    validates :enemyscore
  end
end
