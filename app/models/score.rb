class Score < ApplicationRecord
  validates :number, numericality: { in: 0..12 }
  validates :enemynumber, numericality: { in: 0..12 }
  has_many :score_record, dependent: :destroy
  has_many :record, through: :score_record
end
