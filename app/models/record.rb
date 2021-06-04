class Record < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name_a, presence: true, length: { maximum: 12 }

  with_options length: { maximum: 12 } do
    validates :name_b
    validates :name_c
    validates :enemyname_a
    validates :enemyname_b
    validates :enemyname_c
  end

  with_options length: { maximum: 15 } do
    validates :enemyteam, length: { maximum: 15 }
    validates :teamname, length: { maximum: 15 }
    validates :title, length: { maximum: 15 }
  end

  with_options allow_blank: true, numericality: { only_integer: true }, length: { in: 0..12 } do
    validates :score_1
    validates :score_2
    validates :score_3
    validates :score_4
    validates :score_5
    validates :score_6
    validates :score_7
    validates :score_8
    validates :score_9
    validates :score_10
  end

  with_options allow_blank: true, numericality: { only_integer: true }, length: { in: 0..12 } do
    validates :enemyscore_1
    validates :enemyscore_2
    validates :enemyscore_3
    validates :enemyscore_4
    validates :enemyscore_5
    validates :enemyscore_6
    validates :enemyscore_7
    validates :enemyscore_8
    validates :enemyscore_9
    validates :enemyscore_10
  end
end
