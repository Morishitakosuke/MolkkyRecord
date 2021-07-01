class Record < ApplicationRecord
  paginates_per 3

  geocoded_by :place
  after_validation :geocode, if: :place_changed?

  after_initialize :set_default_values

  belongs_to :user

  validates :place, length: { maximum: 20 }

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

  with_options allow_blank: true, numericality: { in: 0..12 } do
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

  private

  def set_default_values
    self.score_1 ||= 0
    self.score_2 ||= 0
    self.score_3 ||= 0
    self.score_4 ||= 0
    self.score_5 ||= 0
    self.score_6 ||= 0
    self.score_7 ||= 0
    self.score_8 ||= 0
    self.score_9 ||= 0
    self.score_10 ||= 0
    self.enemyscore_1 ||= 0
    self.enemyscore_2 ||= 0
    self.enemyscore_3 ||= 0
    self.enemyscore_4 ||= 0
    self.enemyscore_5 ||= 0
    self.enemyscore_6 ||= 0
    self.enemyscore_7 ||= 0
    self.enemyscore_8 ||= 0
    self.enemyscore_9 ||= 0
    self.enemyscore_10 ||= 0
  end
end
