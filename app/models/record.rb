class Record < ApplicationRecord
  belongs_to :user

  has_many :score_record, dependent: :destroy
  has_many :scores, through: :score_record

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

  def total_score
    Score.all.sum(:number)
    Score.all.sum(:enemynumber)
  end
end
